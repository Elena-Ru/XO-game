//
//  GameEndedState.swift
//  XO-game
//
//  Created by Елена Русских on 07.12.2022.
//

import UIKit

// MARK: - GameEndedState
final class GameEndedState: GameState {
    
    // MARK: Properties
    let isCompleted = false
    let winner: Player?
    private(set) weak var gameVC: GameViewController?
    
    // MARK: Initializer
    init(winner: Player?, gameVC: GameViewController) {
        self.winner = winner
        self.gameVC = gameVC
    }
    
    // MARK: Methods
    func begin() {
        gameVC?.rootView.winnerLabel.isHidden = false
        if let winner = winner {
            gameVC?.rootView.winnerLabel.text = self.getWinnerName(from: winner) + Constants.win
        } else {
            gameVC?.rootView.winnerLabel.text = Constants.noWinner
        }
        gameVC?.rootView.nextButton.isHidden = true
        gameVC?.rootView.firstPlayerTurnLabel.isHidden = true
        gameVC?.rootView.secondPlayerTurnLabel.isHidden = true
        log(.gameFinished(winner: self.winner))
    }
    
    private func getWinnerName( from winner: Player) -> String {
        switch winner {
        case .first: return Constants.firstPlayer
        case .second: return Constants.secondPlayer
        }
    }
    
    func addMark(at position: GameboardPosition) {}
}

// MARK: - Constants
private extension GameEndedState {
    enum Constants {
        static let firstPlayer: String = "1st player"
        static let secondPlayer: String = "2nd player"
        static let noWinner: String = "No winner"
        static let win: String = " win"
    }
}
