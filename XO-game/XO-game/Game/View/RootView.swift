//
//  RootView.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

// MARK: - RootView
final class RootView: UIView {
    
    // MARK: Properties
    var scroll: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.contentSize = CGSize(width: 400, height: 2300)
        return sv
    }()
    
    var gameboardView : GameboardView = {
        let view = GameboardView()
        view.backgroundColor = .white
        return view
    }()
    
    let firstPlayerTurnLabel: CustomPlayerLabel = {
        let label = CustomPlayerLabel(title: "Player1")
        return label
    }()
    
    let secondPlayerTurnLabel: CustomPlayerLabel = {
        let label = CustomPlayerLabel(title: "Player2")
        return label
    }()
    
    let winnerLabel: BoldBlackLabel = {
        let label = BoldBlackLabel(title: "The winner is Player1")
        return label
    }()
    
    let restartButton: RoundedGreenButton = {
        let btn = RoundedGreenButton(title: "Restart")
        return btn
    }()
    let nextButton: RightArrowButton = {
        let btn = RightArrowButton()
        return btn
    }()
    
    // MARK: Initializer
    init() {
        super.init(frame: CGRect())
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setupLayout() {
        self.addSubview(scroll)
        scroll.addSubview(firstPlayerTurnLabel)
        scroll.addSubview(secondPlayerTurnLabel)
        scroll.addSubview(winnerLabel)
        scroll.addSubview(nextButton)
        scroll.addSubview(gameboardView)
        scroll.addSubview(restartButton)
        
        NSLayoutConstraint.activate([
            
            scroll.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scroll.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            scroll.heightAnchor.constraint(equalToConstant: 1200),
            
            firstPlayerTurnLabel.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 20),
            firstPlayerTurnLabel.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            firstPlayerTurnLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            firstPlayerTurnLabel.heightAnchor.constraint(equalToConstant: 20),
            
            secondPlayerTurnLabel.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 20),
            secondPlayerTurnLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            secondPlayerTurnLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            secondPlayerTurnLabel.heightAnchor.constraint(equalToConstant: 20),
            
            winnerLabel.topAnchor.constraint(equalTo: firstPlayerTurnLabel.bottomAnchor, constant: 20),
            winnerLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            winnerLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            winnerLabel.heightAnchor.constraint(equalToConstant: 35),
            
            nextButton.topAnchor.constraint(equalTo: secondPlayerTurnLabel.bottomAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: secondPlayerTurnLabel.trailingAnchor, constant: -60),
            nextButton.widthAnchor.constraint(equalToConstant: 40),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            
            gameboardView.topAnchor.constraint(equalTo: winnerLabel.bottomAnchor, constant: 40),
            gameboardView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            gameboardView.heightAnchor.constraint(equalToConstant: 300),
            gameboardView.widthAnchor.constraint(equalToConstant: 300),
            
            restartButton.topAnchor.constraint(equalTo: gameboardView.bottomAnchor, constant: 100),
            restartButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            restartButton.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            restartButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
