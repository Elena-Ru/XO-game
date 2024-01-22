//
//  MarkView.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

// MARK: - MarkView
class MarkView: UIView, Copying {
        
    // MARK: Properties
    var lineColor: UIColor = .black
    var lineWidth: CGFloat = Constants.lineWidth
    var textColor: UIColor = .red {
        didSet { label.textColor = textColor }
    }
    
    var turnNumbers: [Int] = [] {
        didSet {
            label.text = turnNumbers.map { String($0) }.joined(separator: ",")
        }
    }
    
    private(set) lazy var shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = nil
        shapeLayer.lineWidth = lineWidth
        shapeLayer.strokeColor = lineColor.cgColor
        self.layer.addSublayer(shapeLayer)
        return shapeLayer
    }()
    
    private(set) lazy var label: UILabel = {
        let label = UILabel(frame: CGRect(x: .zero, y: .zero, width: bounds.width, height: Constants.labeleHeightMultiplier * bounds.height))
        label.textColor = textColor
        label.textAlignment = .right
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.labelTopAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            ])
        return label
    }()
    
    // MARK: Initiaizer
    init() {
        super.init(frame: CGRect(x: .zero, y: .zero, width: Constants.width, height: Constants.width))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required init(_ prototype: MarkView) {
        super.init(frame: prototype.frame)
        self.lineColor = prototype.lineColor
        self.lineWidth = prototype.lineWidth
        self.textColor = prototype.textColor
    }
    
    // MARK: UIView
    public final override func layoutSubviews() {
        super.layoutSubviews()
        
        updateLabel()
        updateShapeLayer()
    }
    
    override var frame: CGRect {
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    override var bounds: CGRect {
        didSet {
            setNeedsLayout()
            layoutIfNeeded()
        }
    }
    
    // MARK: UI
    private final func updateLabel() {
        let size = Constants.sizeMultiplier * bounds.height
        label.font = UIFont.systemFont(ofSize: size, weight: .thin)
    }
    
    // MARK: Template methods
    func updateShapeLayer() {
    }
}

private extension MarkView {
    enum Constants {
        static let lineWidth: CGFloat = 7
        static let labeleHeightMultiplier: Double = 0.1
        static let animationTimeInterval: TimeInterval = 0.5
        static let labelTopAnchor: CGFloat = 4
        static let width: CGFloat = 90
        static let height: CGFloat = 90
        static let sizeMultiplier: Double = 0.1
    }
}
