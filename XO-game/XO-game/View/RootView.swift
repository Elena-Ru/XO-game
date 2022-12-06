//
//  RootView.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

class RootView: UIView {
    
  //  var gameboardView: GameboardView
    
    let firstPlayerTurnLabel: CustomPlayerLabel = {
        let label = CustomPlayerLabel(title: "Player1")
        return label
    }()
    
    let secondPlayerTurnLabel: CustomPlayerLabel = {
        let label = CustomPlayerLabel(title: "Player2")
        return label
    }()
    
    let winnerLabel: CustomWinnerLabel = {
        let label = CustomWinnerLabel(title: "The winner is Player1")
        return label
    }()
    
    let restartButton: PurpleButton = {
        let btn = PurpleButton(title: "Restart")
        return btn
    }()
    
    init() {
        super.init(frame: CGRect())
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubview(firstPlayerTurnLabel)
        self.addSubview(secondPlayerTurnLabel)
        self.addSubview(winnerLabel)
        self.addSubview(restartButton)
        
        NSLayoutConstraint.activate([
            firstPlayerTurnLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstPlayerTurnLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            firstPlayerTurnLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            firstPlayerTurnLabel.heightAnchor.constraint(equalToConstant: 20),
            
            secondPlayerTurnLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            secondPlayerTurnLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            secondPlayerTurnLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            secondPlayerTurnLabel.heightAnchor.constraint(equalToConstant: 20),
            
            winnerLabel.topAnchor.constraint(equalTo: firstPlayerTurnLabel.bottomAnchor, constant: 20),
            winnerLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            winnerLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            winnerLabel.heightAnchor.constraint(equalToConstant: 20),
            
            restartButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            restartButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            restartButton.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            restartButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
