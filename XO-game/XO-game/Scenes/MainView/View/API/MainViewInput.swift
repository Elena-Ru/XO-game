//
//  MainViewInput.swift
//  XO-game
//
//  Created by Елена Русских on 2024-01-22.
//

// MARK: - MainViewInput
protocol MainViewInput: AnyObject {
    var presenter: MainViewOutput? { get set }
    func presentGameViewController(gameMode: GameMode)
}
