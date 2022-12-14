//
//  GameState.swift
//  XO-game
//
//  Created by Елена Русских on 07.12.2022.
//

import Foundation

public protocol GameState {
    var isCompleted: Bool { get }
    
    func begin()
    
    func addMark( at position: GameboardPosition )
}
