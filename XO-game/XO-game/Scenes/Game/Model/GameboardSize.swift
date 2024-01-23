//
//  GameboardSize.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

// MARK: - GameboardSize
struct GameboardSize {
    static let columns = Constants.columnsCount
    static let rows = Constants.rowsCount
}

// MARK: - Constants
private extension GameboardSize {
    enum Constants {
        static let columnsCount: Int = 3
        static let rowsCount: Int = 3
    }
}
