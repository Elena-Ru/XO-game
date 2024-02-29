//
//  AIInputState.swift
//  XO-game
//
//  Created by Елена Русских on 08.12.2022.
//

import UIKit

// MARK: - AIInputState
final class AIInputState: GameState {
    // MARK: Properties
    private(set) var isCompleted: Bool = false
    let markViewPrototype: MarkView
    let player: Player
    private(set) weak var gameVC: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    // MARK: Initializer
    init(isCompleted: Bool, markViewPrototype: MarkView, player: Player, gameVC: GameViewController? = nil, gameboard: Gameboard? = nil, gameboardView: GameboardView? = nil) {
        self.isCompleted = isCompleted
        self.markViewPrototype = markViewPrototype
        self.player = player
        self.gameVC = gameVC
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    // MARK: Methods
    func begin() {
       self.gameVC?.rootView.firstPlayerTurnLabel.isHidden = true
       self.gameVC?.rootView.secondPlayerTurnLabel.isHidden = false
       self.gameVC?.rootView.winnerLabel.isHidden = true

       var xIndex = Int.random(in: 0...2)
       var yIndex = Int.random(in: 0...2)
       
       while gameboard?.positions[xIndex][yIndex] != nil {
           xIndex = Int.random(in: 0...2)
           yIndex = Int.random(in: 0...2)
       }
       
       addMark(at: GameboardPosition(column: xIndex, row: yIndex))
       gameVC?.goToNextState()
    }
    
    func addMark(at position: GameboardPosition) {
       guard let gameboardView = self.gameboardView,
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
