//
//  RightArrowButton.swift
//  XO-game
//
//  Created by Елена Русских on 10.12.2022.
//

import UIKit

// MARK: - RightArrowButton
final class RightArrowButton: UIButton {
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(systemName: "arrowshape.right.fill"), for: .normal)
        tintColor = #colorLiteral(red: 0.1957847476, green: 0.8436268568, blue: 0.2952730954, alpha: 1)
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
