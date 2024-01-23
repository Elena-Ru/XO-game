//
//  LogAction.swift
//  XO-game
//
//  Created by Елена Русских on 07.12.2022.
//

// MARK: - LogAction
enum LogAction {
    case playerInput(player: Player, position: GameboardPosition)
    case gameFinished(winner: Player?)
    case restartGame
}

func log(_ action: LogAction) {
    let command = LogCommand(action: action)
    LoggerInvoker.shared.addLogCommand(command)
}
