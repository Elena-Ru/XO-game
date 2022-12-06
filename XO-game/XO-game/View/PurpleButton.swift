//
//  PurpleButton.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

class PurpleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
     init(title: String) {
        super.init(frame: .zero)
        layer.backgroundColor = #colorLiteral(red: 0.2763207555, green: 0.1030554697, blue: 0.3165085614, alpha: 1)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        layer.cornerRadius = 20
        layer.borderColor = UIColor.yellow.cgColor
        layer.borderWidth = 2.0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

