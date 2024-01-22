//
//  OView.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

// MARK: - OView
final class OView: MarkView {
    override func updateShapeLayer() {
        super.updateShapeLayer()
        let center = CGPoint(x: bounds.width / Constants.half, y: bounds.height / Constants.half)
        let radius = Constants.radiusMultiplier * min(bounds.width, bounds.height)
        shapeLayer.path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: Constants.startAngle * CGFloat.pi / Constants.halfPi,
            endAngle: Constants.endAngle * CGFloat.pi / Constants.halfPi,
            clockwise: false
        ).cgPath
    }
}

// MARK: - Constants
private extension OView {
    enum Constants {
        static let radiusMultiplier: Double = 0.3
        static let startAngle: CGFloat = 330
        static let endAngle: CGFloat = -30
        static let halfPi: CGFloat = 180
        static let half: CGFloat = 2
    }
}
