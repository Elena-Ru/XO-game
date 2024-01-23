//
//  PurpleButton.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

// MARK: - RoundedGreenButton
final class RoundedGreenButton: UIButton {
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        layer.backgroundColor = #colorLiteral(red: 0.1957847476, green: 0.8436268568, blue: 0.2952730954, alpha: 1)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: Constants.fontSize)
        layer.cornerRadius = Constants.cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constants
private extension RoundedGreenButton {
    enum Constants {
        static let cornerRadius: CGFloat = 20
        static let fontSize: CGFloat = 20
    }
}
