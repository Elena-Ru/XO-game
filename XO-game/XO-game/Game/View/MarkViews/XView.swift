//
//  XView.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

// MARK: - XView
class XView: MarkView {
    
    override func updateShapeLayer() {
        super.updateShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.25 * bounds.width, y: 0.25 * bounds.height))
        path.addLine(to: CGPoint(x: 0.75 * bounds.width, y: 0.75 * bounds.height))
        path.move(to: CGPoint(x: 0.75 * bounds.width, y: 0.25 * bounds.height))
        path.addLine(to: CGPoint(x: 0.25 * bounds.width, y: 0.75 * bounds.height))
        shapeLayer.path = path.cgPath
    }
}
