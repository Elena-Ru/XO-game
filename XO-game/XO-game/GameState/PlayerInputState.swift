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
    init(player: Player, markViewPrototype: MarkView, gameVC: GameViewController, gameboard: Gameboard, gameboardView: GameboardView) {
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
                self.gameVC?.rootView.firstPlayerTurnLabel.isHidden = false
                self.gameVC?.rootView.secondPlayerTurnLabel.isHidden = true
            case .second:
                self.gameVC?.rootView.firstPlayerTurnLabel.isHidden = true
                self.gameVC?.rootView.secondPlayerTurnLabel.isHidden = false
            }
        } else {
            self.gameVC?.rootView.firstPlayerTurnLabel.isHidden = false
            self.gameVC?.rootView.secondPlayerTurnLabel.isHidden = true
        }
        self.gameVC?.rootView.winnerLabel.isHidden = true

    }

    func addMark(at position: GameboardPosition) {
        guard 
            let gameboardView = self.gameboardView,
            gameboardView.canPlaceMarkView(at: position)
        else {
            return
        }
        log(.playerInput(player: self.player, position: position))
        self.gameboard?.setPlayer(self.player, at: position)
        self.gameboardView?.placeMarkView(self.markViewPrototype.copy(), at: position)
        self.isCompleted = true
    }
    
}
