//
//  GameboardView.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

// MARK: - GameboardView
final class GameboardView: UIView {

    // MARK: Properties
    var onSelectPosition: ((GameboardPosition) -> Void)?
    private(set) var markViewForPosition: [GameboardPosition: MarkView] = [:]
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init() {
        super.init(frame: .zero)
        draw(frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Properties
    private var calculatedColumnWidth: CGFloat {
        bounds.width / CGFloat(GameboardSize.columns)
    }
    private var calculatedRowHeight: CGFloat {
        bounds.height / CGFloat(GameboardSize.rows)
    }
    
    // MARK: - Methods
    func clear() {
        markViewForPosition.forEach { (key, markView) in
            markView.removeFromSuperview()
        }
        markViewForPosition = [:]
    }
    
    func canPlaceMarkView(at position: GameboardPosition) -> Bool {
        markViewForPosition[position] == nil
    }
    
    func placeMarkView(_ markView: MarkView, at position: GameboardPosition) {
        guard self.canPlaceMarkView(at: position) 
        else {
            return
        }
        updateFrame(for: markView, at: position)
        markViewForPosition[position] = markView
        addSubview(markView)
    }
    
    func removeMarkView(at position: GameboardPosition) {
        guard let markView = markViewForPosition[position] 
        else {
            return
        }
        markViewForPosition[position] = nil
        markView.removeFromSuperview()
    }
    
    // MARK: - UIView
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        Constants.lineColor.setStroke()
        drawColumnLines(for: rect)
        drawRowLines(for: rect)
    }
    
    // MARK: - Touch Handling
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchLocation = touches.first?.location(in: self)
        else {
            return
        }
        let position = GameboardPosition(
            column: determineColumn(for: touchLocation),
            row: determineRow(for: touchLocation))
        onSelectPosition?(position)
    }
    
    // MARK: - UI
    private func drawColumnLines(for rect: CGRect) {
        let columnWidth = self.calculatedColumnWidth
        for i in Constants.next ..< GameboardSize.columns {
            let linePath = UIBezierPath()
            linePath.move(to: CGPoint(x: rect.minX + CGFloat(i) * columnWidth,
                                      y: rect.minY))
            linePath.addLine(to: CGPoint(x: rect.minX + CGFloat(i) * columnWidth,
                                         y: rect.minY + rect.height))
            linePath.lineWidth = Constants.lineWidth
            linePath.stroke()
        }
    }
    
    private func drawRowLines(for rect: CGRect) {
        let rowHeight = self.calculatedRowHeight
        for i in Constants.next ..< GameboardSize.rows {
            let linePath = UIBezierPath()
            linePath.move(to: CGPoint(x: rect.minX, y: rect.minY + CGFloat(i) * rowHeight))
            linePath.addLine(to: CGPoint(x: rect.minX + rect.width, y: rect.minY + CGFloat(i) * rowHeight))
            linePath.lineWidth = Constants.lineWidth
            linePath.stroke()
        }
    }
    
    // MARK: - Private Methods
    private func determineColumn(for touchLocation: CGPoint) -> Int {
        let columnWidth = self.calculatedColumnWidth
        let lastColumn = GameboardSize.columns - Constants.next
        for i in .zero ..< lastColumn {
            let xMin = CGFloat(i) * columnWidth
            let xMax = CGFloat(i + Constants.next) * columnWidth
            if (xMin ..< xMax).contains(touchLocation.x) {
                return i
            }
        }
        return lastColumn
    }
    
    private func determineRow(for touchLocation: CGPoint) -> Int {
        let rowHeight = self.calculatedRowHeight
        let lastRow = GameboardSize.rows - Constants.next
        for i in .zero ..< lastRow {
            let yMin = CGFloat(i) * rowHeight
            let yMax = CGFloat(i + Constants.next) * rowHeight
            if (yMin ..< yMax).contains(touchLocation.y) {
                return i
            }
        }
        return lastRow
    }
    
    private func updateFrame(for markView: MarkView, at position: GameboardPosition) {
        let columnWidth = self.calculatedColumnWidth
        let rowHeight = self.calculatedRowHeight
        markView.frame = CGRect(x: CGFloat(position.column) * columnWidth,
                                y: CGFloat(position.row) * rowHeight,
                                width: columnWidth,
                                height: rowHeight).insetBy(
                                    dx: Constants.insetMultiplier * Constants.lineWidth,
                                    dy: Constants.insetMultiplier * Constants.lineWidth)
    }
}

// MARK: - Constants
private extension GameboardView {
    enum Constants {
        static let lineColor: UIColor = .gray
        static let lineWidth: CGFloat = 7
        static let insetMultiplier: Double = 0.5
        static let next: Int = 1
    }
}
