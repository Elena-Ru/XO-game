//
//  LogAction.swift
//  XO-game
//
//  Created by Елена Русских on 07.12.2022.
//

import Foundation

public enum LogAction {
    case playerInput(player: Player, position: GameboardPosition)
    case gameFinished(winner: Player?)
    case restartGame
}

public func log(_ action: LogAction) {
    let command = LogCommand(action: action)
    LoggerInvoker.shared.addLogCommand(command)
}
