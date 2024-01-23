//
//  XView.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

// MARK: - XView
final class XView: MarkView {
    override func updateShapeLayer() {
        super.updateShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(
            x: Constants.startPoint * bounds.width,
            y: Constants.startPoint * bounds.height))
        path.addLine(to: CGPoint(
            x: Constants.endPoint * bounds.width,
            y: Constants.endPoint * bounds.height))
        path.move(to: CGPoint(
            x: Constants.endPoint * bounds.width,
            y: Constants.startPoint * bounds.height))
        path.addLine(to: CGPoint(
            x: Constants.startPoint * bounds.width,
            y: Constants.endPoint * bounds.height))
        shapeLayer.path = path.cgPath
    }
}

// MARK: - Constants
private extension XView {
    enum Constants {
        static let startPoint: CGFloat = 0.25
        static let endPoint: CGFloat = 0.75
    }
}
