//
//  PurpleButton.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

class RoundedGreenButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
     init(title: String) {
        super.init(frame: .zero)
        layer.backgroundColor = #colorLiteral(red: 0.1957847476, green: 0.8436268568, blue: 0.2952730954, alpha: 1)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        layer.cornerRadius = 20
        layer.borderColor = #colorLiteral(red: 1, green: 0.8416574597, blue: 0.0318945162, alpha: 1)
        layer.borderWidth = 2.0
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

