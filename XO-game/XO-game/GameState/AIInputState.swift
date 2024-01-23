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
    init(
        isCompleted: Bool,
        markViewPrototype: MarkView,
        player: Player,
        gameVC: GameViewController? = nil,
        gameboard: Gameboard? = nil,
        gameboardView: GameboardView? = nil
    ) {
        self.isCompleted = isCompleted
        self.markViewPrototype = markViewPrototype
        self.player = player
        self.gameVC = gameVC
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    // MARK: Methods
    func begin() {
       gameVC?.rootView.firstPlayerTurnLabel.isHidden = true
       gameVC?.rootView.secondPlayerTurnLabel.isHidden = false
       gameVC?.rootView.winnerLabel.isHidden = true

       var xIndex = Int.random(in: Constants.minIndex...Constants.maxIndex)
       var yIndex = Int.random(in: Constants.minIndex...Constants.maxIndex)
       
       while gameboard?.positions[xIndex][yIndex] != nil {
           xIndex = Int.random(in: Constants.minIndex...Constants.maxIndex)
           yIndex = Int.random(in: Constants.minIndex...Constants.maxIndex)
       }
       
       addMark(at: GameboardPosition(column: xIndex, row: yIndex))
       gameVC?.goToNextState()
    }
    
    func addMark(at position: GameboardPosition) {
       guard let gameboardView = gameboardView,
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

private extension AIInputState {
    enum Constants {
        static let minIndex: Int = .zero
        static let maxIndex: Int = 2
    }
}
