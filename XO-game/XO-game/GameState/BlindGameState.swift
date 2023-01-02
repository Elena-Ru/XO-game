//
//  BlindGameState.swift
//  XO-game
//
//  Created by Елена Русских on 09.12.2022.
//

import UIKit

class BlindGameState: GameState {
    
    public private(set) var isCompleted = false
    public let markViewPrototype: MarkView
    public let player: Player
    private(set) weak var gameVC: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    init(player: Player, markViewPrototype: MarkView, gameVC: GameViewController, gameboard: Gameboard, gameboardView: GameboardView) {
        self.player = player
        self.markViewPrototype = markViewPrototype
        self.gameVC = gameVC
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    public func begin() {
        
        var position : GameboardPosition
        var firstPlayerPositions = gameboard?.firstPlayerpositions
        var secondPlayerPositions = gameboard?.secondPlayerpositions
            switch self.player {
            case .first:
                self.gameVC?.rootView.firstPlayerTurnLabel.isHidden = false
                self.gameVC?.rootView.secondPlayerTurnLabel.isHidden = true
                guard (firstPlayerPositions?.count)! > 1  else {
                     return
                 }
                position = (firstPlayerPositions?.first)!
    
                while !(gameboardView?.canPlaceMarkView(at: position))! && (firstPlayerPositions?.count)! > 1 {
                    firstPlayerPositions?.removeFirst()
                    position = (firstPlayerPositions?.first)!
                }
            case .second:
                self.gameVC?.rootView.firstPlayerTurnLabel.isHidden = true
                self.gameVC?.rootView.secondPlayerTurnLabel.isHidden = false
               guard (secondPlayerPositions?.count)! > 1  else {
                    return
                }
                position = (secondPlayerPositions?.first)!
             
                while !(gameboardView?.canPlaceMarkView(at: position))! && (secondPlayerPositions?.count)! > 1 {
                    
                    secondPlayerPositions?.removeFirst()
                    position = (secondPlayerPositions?.first)!
                }
            }
        self.gameVC?.rootView.winnerLabel.isHidden = true
        self.gameVC?.rootView.nextButton.isHidden = false
        
        addMark(at: position)
        if self.player == .first {
            firstPlayerPositions?.removeFirst()
        } else {
            secondPlayerPositions?.removeFirst()
        }
    }
    
    public func addMark(at position: GameboardPosition) {
        guard let gameboardView = self.gameboardView,
              gameboardView.canPlaceMarkView(at: position) else {
            return
        }
        log(.playerInput(player: self.player, position: position))
        self.gameboard?.setPlayer(self.player, at: position)
        self.gameboardView?.placeMarkView(self.markViewPrototype.copy(), at: position)
        self.isCompleted = true
    }
    
}
