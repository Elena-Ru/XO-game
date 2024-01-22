//
//  MarkView.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

// MARK: - MarkView
class MarkView: UIView, Copying {
        
    // MARK: - Properties
    var lineColor: UIColor = .black
    var lineWidth: CGFloat = 7
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
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 0.1 * bounds.height))
        label.textColor = textColor
        label.textAlignment = .right
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal,
                           toItem: self, attribute: .top, multiplier: 1, constant: 4).isActive = true
        NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal,
                           toItem: self, attribute: .height, multiplier: 0.1, constant: 0).isActive = true
        NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal,
                           toItem: self, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal,
                           toItem: label, attribute: .trailing, multiplier: 1, constant: 4).isActive = true
        
        return label
    }()
    
    // MARK: - Initiaizer
    init() {
        super.init(frame: CGRect(origin: .zero,
                                 size: CGSize(width: 90, height: 90)))
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
    
    // MARK: - UIView
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
    
    // MARK: - Methods
    func animateIn(
        duration: TimeInterval = 0.5,
        completion: @escaping () -> Void
    ) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0.0
        animation.toValue = 1.0
        shapeLayer.add(animation, forKey: nil)
        CATransaction.commit()
    }
    
    func animateOut(
        duration: TimeInterval = 0.5,
        completion: @escaping () -> Void
    ) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = duration
        animation.fromValue = 1.0
        animation.toValue = 0.0
        shapeLayer.add(animation, forKey: nil)
        CATransaction.commit()
    }
    
    // MARK: - UI
    private final func updateLabel() {
        let size = 0.1 * bounds.height
        label.font = UIFont.systemFont(ofSize: size, weight: .thin)
    }
    
    // MARK: - Template methods
    func updateShapeLayer() {
        // meant for subclasses to override
    }
}

