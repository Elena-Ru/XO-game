//
//  Referee.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

// MARK: - Referee
final class Referee {
    
    // MARK: Properties
    let gameboard: Gameboard
    
    private(set) lazy var winningCombinations: [[GameboardPosition]] = {
        var winningCombinations: [[GameboardPosition]] = []
        generateWinsByColumn(result: &winningCombinations)
        generateWinsByRow(result: &winningCombinations)
        generateWinLeftDiagonal(result: &winningCombinations)
        generateWinRightDiagonal(result: &winningCombinations)
        return winningCombinations
    }()
    
    // MARK: Initializer
    init(gameboard: Gameboard) {
        self.gameboard = gameboard
    }
    
    // MARK: Methods
    func determineWinner() -> Player? {
        for player in Player.allCases {
            if doesPlayerWinningCombination(player) {
                return player
            }
        }
        return nil
    }
    
    private func generateWinsByColumn(result: inout [[GameboardPosition]]) {
        var array: [GameboardPosition] = []
        for column in .zero ..< GameboardSize.columns {
            for row in .zero ..< GameboardSize.rows {
                array.append(GameboardPosition(column: column, row: row))
            }
            result.append(array)
            array = []
        }
    }
    
    private func generateWinsByRow(result: inout [[GameboardPosition]]) {
        var array: [GameboardPosition] = []
        for row in .zero ..< GameboardSize.rows {
            for column in .zero ..< GameboardSize.columns {
                array.append(GameboardPosition(column: column, row: row))
            }
            result.append(array)
            array = []
        }
    }
    
    private func generateWinLeftDiagonal(result: inout [[GameboardPosition]]) {
        guard GameboardSize.columns == GameboardSize.rows else { return }
        var array: [GameboardPosition] = []
        for i in .zero ..< GameboardSize.columns {
            array.append(GameboardPosition(column: i, row: i))
        }
        result.append(array)
    }
                         
    private func generateWinRightDiagonal(result: inout [[GameboardPosition]]) {
        guard GameboardSize.columns == GameboardSize.rows else { return }
        var array: [GameboardPosition] = []
        for i in .zero ..< GameboardSize.rows {
            array.append(GameboardPosition(column: i, row: GameboardSize.rows - Constants.previous - i))
        }
        result.append(array)
    }
                         
    private func doesPlayerWinningCombination(_ player: Player) -> Bool {
        for winningPosition in winningCombinations {
            if gameboard.contains(player: player, at: winningPosition){
                return true
            }
        }
        return false
    }
}

private extension Referee {
    enum Constants {
        static let previous: Int = 1
    }
}
