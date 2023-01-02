//
//  MainRootView.swift
//  XO-game
//
//  Created by Елена Русских on 08.12.2022.
//

import UIKit

class MainRootView: UIView {
    
    let titleLabel: BoldBlackLabel = {
        let label = BoldBlackLabel(title: "Tic-Tac-Toe")
        return label
    }()
    
    let logo : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let gameWithPCButton: RoundedGreenButton = {
        let btn = RoundedGreenButton(title: "Game with AI")
        return btn
    }()
        
    let gameWithHumanButton: RoundedGreenButton = {
        let btn = RoundedGreenButton(title: "Game for 2")
        return btn
    }()
    
    let blindGameButton: RoundedGreenButton = {
        let btn = RoundedGreenButton(title: "Blind Game")
        return btn
    }()
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        creatView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func creatView() {
        setupLayout()
    }
    
    private func setupButtons() {
        
        let controlsStackView = UIStackView(arrangedSubviews: [gameWithPCButton, gameWithHumanButton, blindGameButton ])
        controlsStackView.translatesAutoresizingMaskIntoConstraints = false
        controlsStackView.distribution = .fillEqually
        controlsStackView.setCustomSpacing(15, after: gameWithPCButton)
        controlsStackView.setCustomSpacing(15, after: gameWithHumanButton)
        controlsStackView.setCustomSpacing(15, after: blindGameButton)
        controlsStackView.axis = .vertical
        
        addSubview(controlsStackView)
        
        NSLayoutConstraint.activate([
            controlsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            controlsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            controlsStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6) ,
            controlsStackView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    private func setupLayout() {
        
        addSubview(titleLabel)
        addSubview(logo)
        let controlsStackView = UIStackView(arrangedSubviews: [gameWithPCButton, gameWithHumanButton, blindGameButton ])
        controlsStackView.translatesAutoresizingMaskIntoConstraints = false
        controlsStackView.distribution = .fillEqually
        controlsStackView.setCustomSpacing(15, after: gameWithPCButton)
        controlsStackView.setCustomSpacing(15, after: gameWithHumanButton)
        controlsStackView.setCustomSpacing(15, after: blindGameButton)
        controlsStackView.axis = .vertical
        
        addSubview(controlsStackView)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.5),
            logo.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            
            controlsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            controlsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            controlsStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6) ,
            controlsStackView.heightAnchor.constraint(equalToConstant: 130)
            
            ])
    }
}
