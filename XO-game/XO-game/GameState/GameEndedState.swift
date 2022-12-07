//
//  GameEndedState.swift
//  XO-game
//
//  Created by Елена Русских on 07.12.2022.
//

import UIKit

public class GameEndedState: GameState {

    public let isCompleted = false
    public let winner: Player?
    private(set) weak var gameVC: MainViewController?
    
    init(winner: Player?, gameVC: MainViewController) {
        self.winner = winner
        self.gameVC = gameVC
    }
    
    public func begin() {
        self.gameVC?.rootView.winnerLabel.isHidden = false
        if let winner = winner {
            self.gameVC?.rootView.winnerLabel.text = self.getWinnerName(from: winner) + "win"
        } else {
            self.gameVC?.rootView.winnerLabel.text = "No winner"
        }
        self.gameVC?.rootView.firstPlayerTurnLabel.isHidden = true
        self.gameVC?.rootView.secondPlayerTurnLabel.isHidden = true
    }
    
    private func getWinnerName( from winner: Player) -> String {
        switch winner {
        case .first: return "1sr player"
        case .second: return "2nd player"
        }
    }
    
    public func addMark(at position: GameboardPosition) {}
}
