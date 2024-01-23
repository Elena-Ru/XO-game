//
//  BlindGameState.swift
//  XO-game
//
//  Created by Елена Русских on 09.12.2022.
//

import UIKit

// MARK: - GameEndedState
final class BlindGameState: GameState {
    
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
        var position: GameboardPosition
        var firstPlayerPositions = gameboard?.firstPlayerpositions
        var secondPlayerPositions = gameboard?.secondPlayerpositions
            switch self.player {
            case .first:
                gameVC?.rootView.firstPlayerTurnLabel.isHidden = false
                gameVC?.rootView.secondPlayerTurnLabel.isHidden = true
                guard (firstPlayerPositions?.count)! > 1  
                else {
                     return
                 }
                position = (firstPlayerPositions?.first)!
    
                while !(gameboardView?.canPlaceMarkView(at: position))! && (firstPlayerPositions?.count)! > 1 {
                    firstPlayerPositions?.removeFirst()
                    position = (firstPlayerPositions?.first)!
                }
            case .second:
                gameVC?.rootView.firstPlayerTurnLabel.isHidden = true
                gameVC?.rootView.secondPlayerTurnLabel.isHidden = false
                guard (secondPlayerPositions?.count)! > 1  
                else {
                    return
                }
                position = (secondPlayerPositions?.first)!
             
                while !(gameboardView?.canPlaceMarkView(at: position))! && (secondPlayerPositions?.count)! > 1 {
                    
                    secondPlayerPositions?.removeFirst()
                    position = (secondPlayerPositions?.first)!
                }
            }
        gameVC?.rootView.winnerLabel.isHidden = true
        gameVC?.rootView.nextButton.isHidden = false
        
        addMark(at: position)
        if self.player == .first {
            firstPlayerPositions?.removeFirst()
        } else {
            secondPlayerPositions?.removeFirst()
        }
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
