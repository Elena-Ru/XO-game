//
//  RootView.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

// MARK: - RootView
final class GameRootView: UIView {
    
    // MARK: Properties
    var gameboardView : GameboardView = {
        let view = GameboardView()
        view.backgroundColor = .white
        return view
    }()
    
    let firstPlayerTurnLabel: CustomPlayerLabel = {
        CustomPlayerLabel(title: Constants.Strings.firstPlayerTitle)
    }()
    
    let secondPlayerTurnLabel: CustomPlayerLabel = {
        CustomPlayerLabel(title: Constants.Strings.secondPlayerTitle)
    }()
    
    let winnerLabel: BoldBlackLabel = {
        BoldBlackLabel(title: Constants.Strings.winnerLabelTitle)
    }()
    
    let restartButton: RoundedGreenButton = {
        RoundedGreenButton(title: Constants.Strings.restartButtonTitle)
    }()
    
    let nextButton: RightArrowButton = {
        RightArrowButton()
    }()
    
    // MARK: Initializer
    init() {
        super.init(frame: CGRect())
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setupViews() {
        [
            firstPlayerTurnLabel,
            secondPlayerTurnLabel,
            winnerLabel,
            nextButton,
            gameboardView,
            restartButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            firstPlayerTurnLabel.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor,
                constant: Constants.Layout.firstPlayerTurnLabelTopInset),
            firstPlayerTurnLabel.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.Layout.firstPlayerTurnLabelLeadingInset),
            
            secondPlayerTurnLabel.topAnchor.constraint(equalTo: firstPlayerTurnLabel.topAnchor),
            secondPlayerTurnLabel.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.Layout.secondPlayerTurnLabelTrailingInset),
            
            winnerLabel.topAnchor.constraint(
                equalTo: firstPlayerTurnLabel.bottomAnchor,
                constant: Constants.Layout.winnerLabelTopInset),
            winnerLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            nextButton.topAnchor.constraint(
                equalTo: secondPlayerTurnLabel.bottomAnchor,
                constant: Constants.Layout.nextButtonTopInset),
            nextButton.trailingAnchor.constraint(
                equalTo: secondPlayerTurnLabel.trailingAnchor,
                constant: Constants.Layout.nextButtonTrailingInset),
            nextButton.widthAnchor.constraint(equalToConstant: Constants.Layout.nextButtonWidth),
            nextButton.heightAnchor.constraint(equalToConstant: Constants.Layout.nextButtonHeight),
            
            gameboardView.topAnchor.constraint(
                equalTo: winnerLabel.bottomAnchor,
                constant: Constants.Layout.gameboardViewTopInset),
            gameboardView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            gameboardView.heightAnchor.constraint(equalToConstant: Constants.Layout.gameboardViewHeight),
            gameboardView.widthAnchor.constraint(equalToConstant: Constants.Layout.gameboardViewWidth),
            
            restartButton.topAnchor.constraint(
                equalTo: gameboardView.bottomAnchor,
                constant: Constants.Layout.restartButtonTopInset),
            restartButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            restartButton.widthAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.widthAnchor,
                multiplier: Constants.Layout.multiplier),
            restartButton.heightAnchor.constraint(equalToConstant: Constants.Layout.restartButtonHeight)
        ])
    }
}

// MARK: - Constants
private extension GameRootView {
    enum Constants {
        enum Layout {
            static let gameboardViewHeight: CGFloat = 300
            static let gameboardViewWidth: CGFloat = 300
            static let gameboardViewTopInset: CGFloat = 40
            static let nextButtonWidth: CGFloat = 40
            static let nextButtonHeight: CGFloat = 40
            static let nextButtonTrailingInset: CGFloat = -60
            static let nextButtonTopInset: CGFloat = 20
            static let winnerLabelTopInset: CGFloat = 20
            static let secondPlayerTurnLabelTrailingInset: CGFloat = -20
            static let restartButtonHeight: CGFloat = 40
            static let multiplier: Double = 0.5
            static let restartButtonTopInset: CGFloat = 100
            static let firstPlayerTurnLabelTopInset: CGFloat = 20
            static let firstPlayerTurnLabelLeadingInset: CGFloat = 20
        }
        
        enum Strings {
            static let firstPlayerTitle: String = "Player1"
            static let secondPlayerTitle: String = "Player2"
            static let winnerLabelTitle: String = "The winner is Player1"
            static let restartButtonTitle: String = "Restart"
        }
    }
}
