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
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = 0.3 * min(bounds.width, bounds.height)
        shapeLayer.path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: 330 * CGFloat.pi / 180,
            endAngle: -30 * CGFloat.pi / 180,
            clockwise: false
        ).cgPath
    }
}
