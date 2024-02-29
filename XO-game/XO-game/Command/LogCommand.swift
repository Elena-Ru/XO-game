//
//  LogCommand.swift
//  XO-game
//
//  Created by Елена Русских on 08.12.2022.
//

import Foundation

final class LogCommand {
    
    let action: LogAction
    
    init(action: LogAction) {
        self.action = action
    }
    
    var logMessage: String {
        switch self.action {
        case .playerInput(player: let player , position: let position):
            return "\(player) placed mark at \(position)"
        case .gameFinished(winner: let winner):
            if let winner = winner {
                return "\(winner) win game"
            } else {
                return "game finished with no winner"
            }
        case .restartGame:
            return "game restarted"
        }
    }
}
