//
//  MainViewPresenter.swift
//  XO-game
//
//  Created by Елена Русских on 2024-01-22.
//

// MARK: - MainViewPresenter
final class MainViewPresenter: MainViewOutput {
    weak var viewController: MainViewInput?
    
    func didSelectGameWithPC() {
        print("Game with AI")
        viewController?.presentGameViewController(gameMode: .withAI)
    }
    
    func didSelectGameWithHuman() {
        print("Game with human")
        viewController?.presentGameViewController(gameMode: .withHuman)
    }
    
    func didSelectBlindGame() {
        print("Blind game")
        viewController?.presentGameViewController(gameMode: .blindGame)
    }
}
