//
//  Copying.swift
//  XO-game
//
//  Created by Елена Русских on 07.12.2022.
//

// MARK: - Copying
protocol Copying {
    init(_ prototype: Self)
}

// MARK: - Copy
extension Copying {
    func copy() -> Self {
        return type(of: self).init(self)
    }
}
