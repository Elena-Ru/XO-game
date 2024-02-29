//
//  PlyerInputBGState.swift
//  XO-game
//
//  Created by Елена Русских on 09.12.2022.
//

import UIKit

// MARK: - GameEndedState
final class PlayerInputBGState: GameState {
    
    // MARK: Properties
    private(set) var isCompleted = false
    let markViewPrototype: MarkView
    let player: Player
    var count: Int!
    private(set) weak var gameVC: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    // MARK: Initializer
    init(
        player: Player,
        markViewPrototype: MarkView,
        gameVC: GameViewController,
        gameboard: Gameboard,
        count: Int,
        gameboardView: GameboardView
    ) {
        self.player = player
        self.count = count
        self.markViewPrototype = markViewPrototype
        self.gameVC = gameVC
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    // MARK: Methods
    func begin() {
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
    
    func addMark(at position: GameboardPosition) {
        guard let gameboardView = self.gameboardView,
              gameboardView.canPlaceMarkView(at: position) else {
            return
        }
        switch self.player{
        case .first:
            self.gameboard?.firstPlayerpositions.append(position)
        case .second:
            self.gameboard?.secondPlayerpositions.append(position)
        }
        
        self.gameboardView?.placeMarkView(self.markViewPrototype.copy(), at: position)
        count += 1
        self.isCompleted = true
    }
}
