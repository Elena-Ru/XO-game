//
//  CustomWinnerLabel.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//
import UIKit

// MARK: - BoldBlackLabel
final class BoldBlackLabel: UILabel {
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        textColor = .black
        text = title
        font = UIFont.boldSystemFont(ofSize: 35)
        textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
