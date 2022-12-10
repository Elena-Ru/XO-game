//
//  PlyerInputBGState.swift
//  XO-game
//
//  Created by Елена Русских on 09.12.2022.
//

import UIKit

class PlayerInputBGState: GameState {
    
    public private(set) var isCompleted = false
    public let markViewPrototype: MarkView
    public let player: Player
    public var count: Int!
    private(set) weak var gameVC: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    init(player: Player, markViewPrototype: MarkView, gameVC: GameViewController, gameboard: Gameboard, count: Int, gameboardView: GameboardView) {
        self.player = player
        self.count = count
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
