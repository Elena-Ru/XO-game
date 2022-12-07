//
//  Copying.swift
//  XO-game
//
//  Created by Елена Русских on 07.12.2022.
//

import Foundation

protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    func copy() -> Self {
        return type(of: self).init(self)
    }
}
