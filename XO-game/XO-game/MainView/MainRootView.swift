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
        let btn = RoundedGreenButton(title: "Game with PC")
        return btn
    }()
        
    let gameWithHumanButton: RoundedGreenButton = {
        let btn = RoundedGreenButton(title: "Game for 2")
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
        setupButtons()
        setupLayout()
    }
    
    private func setupButtons() {
        
        let controlsStackView = UIStackView(arrangedSubviews: [gameWithPCButton, gameWithHumanButton])
        controlsStackView.translatesAutoresizingMaskIntoConstraints = false
        controlsStackView.distribution = .fillEqually
        controlsStackView.setCustomSpacing(20, after: gameWithPCButton)
        controlsStackView.setCustomSpacing(20, after: gameWithHumanButton)
        controlsStackView.axis = .vertical
        
        addSubview(controlsStackView)
        
        NSLayoutConstraint.activate([
            controlsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            controlsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            controlsStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7) ,
            controlsStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupLayout() {
        
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.addSubview(titleLabel)
        topImageContainerView.addSubview(logo)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            topImageContainerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),
            
            titleLabel.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            logo.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            logo.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5),
            logo.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            ])
    }
}
