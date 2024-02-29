//
//  Gameboard.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

// MARK: - Gameboard
final class Gameboard {
    
    // MARK: Properties
    public lazy var positions: [[Player?]] = initialPositions()
    public lazy var firstPlayerpositions: [GameboardPosition] = []
    public lazy var secondPlayerpositions: [GameboardPosition] = []

    // MARK: Methods
    func setPlayer(_ player: Player, at position: GameboardPosition) {
        positions[position.column][position.row] = player
    }
    
    func clear() {
        self.positions = initialPositions()
    }
    
    func contains(player: Player, at positions: [GameboardPosition]) -> Bool {
        for position in positions {
            guard contains(player: player, at: position) else {
                return false
            }
        }
        return true
    }
    
    func contains(player: Player, at position: GameboardPosition) -> Bool {
        let (column, row) = (position.column, position.row)
        return positions[column][row] == player
    }
    
    func friendshipCase() -> Bool {
        for i in .zero ..< GameboardSize.columns {
            for j in .zero ..< GameboardSize.rows {
                if positions[i][j] == nil {
                    return false
                }
            }
        }
        return true
    }
    
    // MARK: Private methods
    private func initialPositions() -> [[Player?]] {
        var positions: [[Player?]] = []
        for _ in .zero ..< GameboardSize.columns {
            let rows = Array<Player?>(repeating: nil, count: GameboardSize.rows)
            positions.append(rows)
        }
        return positions
    }
}
