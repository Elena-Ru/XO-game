//
//  CustomPlayerLabel.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

// MARK: - CustomPlayerLabel
final class CustomPlayerLabel: UILabel {
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
     init(title: String) {
        super.init(frame: .zero)
        textColor = .darkGray
        text = title
         font = UIFont.systemFont(ofSize: Constants.fontSize)
        textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constants
private extension CustomPlayerLabel {
    enum Constants {
        static let fontSize: CGFloat = 18
    }
}
