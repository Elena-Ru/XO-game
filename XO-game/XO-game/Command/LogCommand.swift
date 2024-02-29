//
//  LogCommand.swift
//  XO-game
//
//  Created by Елена Русских on 08.12.2022.
//

// MARK: - LogCommand
final class LogCommand {
    
    // MARK: Properties
    let action: LogAction
    
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
    
    // MARK: Iniktializer
    init(action: LogAction) {
        self.action = action
    }
}
