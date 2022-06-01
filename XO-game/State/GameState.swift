//
//  GameState.swift
//  XO-game
//
//  Created by Ованес Захарян on 01.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation


protocol GameState {
    var isCompleted: Bool { get }
    
    func begin()
    
    func addMark(at position: GameboardPosition)
}
