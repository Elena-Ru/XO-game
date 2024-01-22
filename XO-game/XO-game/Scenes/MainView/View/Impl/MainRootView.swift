//
//  MainRootView.swift
//  XO-game
//
//  Created by Елена Русских on 08.12.2022.
//

import UIKit

// MARK: - MainRootView
final class MainRootView: UIView {
    
    // MARK: Properties
    let titleLabel: BoldBlackLabel = {
        let label = BoldBlackLabel(title: Constants.Strings.titleLabel)
        return label
    }()
    
    let logo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: Constants.Images.logoImage))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let gameWithPCButton: RoundedGreenButton = {
        let btn = RoundedGreenButton(title: Constants.Strings.gameWithPCTitle)
        return btn
    }()
        
    let gameWithHumanButton: RoundedGreenButton = {
        let btn = RoundedGreenButton(title: Constants.Strings.gameWithHumanTitle)
        return btn
    }()
    
    let blindGameButton: RoundedGreenButton = {
        let btn = RoundedGreenButton(title: Constants.Strings.blindGameTitle)
        return btn
    }()
    
    lazy var controlsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [gameWithPCButton, gameWithHumanButton, blindGameButton ])
        stack.distribution = .fillEqually
        stack.setCustomSpacing(Constants.Layout.spacing, after: gameWithPCButton)
        stack.setCustomSpacing(Constants.Layout.spacing, after: gameWithHumanButton)
        stack.setCustomSpacing(Constants.Layout.spacing, after: blindGameButton)
        stack.axis = .vertical
        return stack
    }()
    
    // MARK: Initializer
    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        creatView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func creatView() {
        setupViews()
        setupLayout()
    }
    
    private func setupViews() {
        [
            titleLabel,
            logo,
            controlsStackView
        ].forEach { 
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.Layout.titleLabelTopAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            logo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logo.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.Layout.logoSizeMultiplier),
            logo.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Constants.Layout.logoSizeMultiplier),
            
            controlsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            controlsStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: Constants.Layout.stackBottomAnchor),
            controlsStackView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: Constants.Layout.stackWidthMultiplier) ,
            controlsStackView.heightAnchor.constraint(equalToConstant: Constants.Layout.stackHeight)
            ])
    }
}

// MARK: - Constants
private extension MainRootView {
    enum Constants {
        enum Layout {
            static let spacing: CGFloat = 15
            static let titleLabelTopAnchor: CGFloat = 200
            static let logoSizeMultiplier: Double = 0.5
            static let stackWidthMultiplier: Double = 0.6
            static let stackHeight: CGFloat = 130
            static let stackBottomAnchor: CGFloat = -40
        }
        
        enum Strings {
            static let titleLabel: String  = "Tic-Tac-Toe"
            static let gameWithHumanTitle: String  = "Game for 2"
            static let gameWithPCTitle: String  = "Game with AI"
            static let blindGameTitle: String  = "Blind Game"
        }
        
        enum Images {
            static let logoImage: String = "logo"
        }
    }
}
