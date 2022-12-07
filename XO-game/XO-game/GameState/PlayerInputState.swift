//
//  PlayerInputState.swift
//  XO-game
//
//  Created by Елена Русских on 07.12.2022.
//

import UIKit

class PlayerInputState: GameState {
    
    public private(set) var isCompleted = false
    public let markViewPrototype: MarkView
    public let player: Player
    private(set) weak var gameVC: MainViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    init(player: Player, markViewPrototype: MarkView, gameVC: MainViewController, gameboard: Gameboard, gameboardView: GameboardView) {
        self.player = player
        self.markViewPrototype = markViewPrototype
        self.gameVC = gameVC
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    public func begin() {
        switch self.player {
        case .first:
            self.gameVC?.rootView.firstPlayerTurnLabel.isHidden = false
            self.gameVC?.rootView.secondPlayerTurnLabel.isHidden = true
        case .second:
            self.gameVC?.rootView.firstPlayerTurnLabel.isHidden = true
            self.gameVC?.rootView.secondPlayerTurnLabel.isHidden = false
        }
        self.gameVC?.rootView.winnerLabel.isHidden = true
    }
    
    public func addMark(at position: GameboardPosition) {
        guard let gameboardView = self.gameboardView,
              gameboardView.canPlaceMarkView(at: position) else {
            return
        }
        self.gameboard?.setPlayer(self.player, at: position)
        self.gameboardView?.placeMarkView(self.markViewPrototype.copy(), at: position)
        self.isCompleted = true
    }
    
}
