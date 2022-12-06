//
//  CustomPlayerLabel.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

class CustomPlayerLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
     init(title: String) {
        super.init(frame: .zero)
        textColor = .white
        text = title
        font = UIFont.systemFont(ofSize: 18)
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
