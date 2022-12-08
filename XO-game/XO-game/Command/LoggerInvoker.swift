//
//  LoggerInvoker.swift
//  XO-game
//
//  Created by Елена Русских on 08.12.2022.
//

import Foundation

internal final class LoggerInvoker {
    internal static let shared = LoggerInvoker()
    
    private let logger = Logger()
    private let batchSize = 3
    private var commands: [LogCommand] = []
    
    internal func addLogCommand(_ command: LogCommand) {
        self.commands.append(command)
        self.executeCommandsIfNeeded()
    }
    
    private func executeCommandsIfNeeded() {
        guard self.commands.count >= batchSize else {
            return
        }
        self.commands.forEach { self.logger.writeMassageToLog($0.logMessage) }
        self.commands = []
    }
}
