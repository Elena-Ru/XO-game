//
//  PlayerInputState.swift
//  XO-game
//
//  Created by Елена Русских on 07.12.2022.
//

import UIKit

// MARK: - PlayerInputState
class PlayerInputState: GameState {
    
    // MARK: Properties
    private(set) var isCompleted = false
    let markViewPrototype: MarkView
    let player: Player
    private(set) weak var gameVC: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    // MARK: Initializer
    init(
        player: Player,
        markViewPrototype: MarkView,
        gameVC: GameViewController,
        gameboard: Gameboard,
        gameboardView: GameboardView
    ) {
        self.player = player
        self.markViewPrototype = markViewPrototype
        self.gameVC = gameVC
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    // MARK: Methods
    func begin() {
        if gameVC?.gameMode == .withHuman{
            switch self.player {
            case .first:
                gameVC?.rootView.firstPlayerTurnLabel.isHidden = false
                gameVC?.rootView.secondPlayerTurnLabel.isHidden = true
            case .second:
                gameVC?.rootView.firstPlayerTurnLabel.isHidden = true
                gameVC?.rootView.secondPlayerTurnLabel.isHidden = false
            }
        } else {
            gameVC?.rootView.firstPlayerTurnLabel.isHidden = false
            gameVC?.rootView.secondPlayerTurnLabel.isHidden = true
        }
        gameVC?.rootView.winnerLabel.isHidden = true

    }

    func addMark(at position: GameboardPosition) {
        guard 
            let gameboardView = gameboardView,
            gameboardView.canPlaceMarkView(at: position)
        else {
            return
        }
        log(.playerInput(player: player, position: position))
        gameboard?.setPlayer(player, at: position)
        gameboardView.placeMarkView(markViewPrototype.copy(), at: position)
        isCompleted = true
    }
    
}
