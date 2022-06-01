//
//  PlayerInputState.swift
//  XO-game
//
//  Created by Ованес Захарян on 01.06.2022.
//  Copyright © 2022 plasmon. All rights reserved.
//

import Foundation


class PlayerInputState: GameState {
   
    
    // MARK: - Properties
    
    var isCompleted: Bool = false
    
    let player: Player
    private(set) weak var gameViewController: GameViewController?
    private(set) weak var gameboard: Gameboard?
    private(set) weak var gameboardView: GameboardView?
    
    
    //MARK: - Construction
    
    init(player: Player, gameViewController: GameViewController, gameboard: Gameboard, gameboardView: GameboardView) {
        self.player = player
        self.gameViewController = gameViewController
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    
    // MARK: - Functions
    
    
    func begin() {
        switch player {
        case .first:
            gameViewController?.firstPlayerTurnLabel.isHidden = false
            gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .second:
            gameViewController?.firstPlayerTurnLabel.isHidden = true
            gameViewController?.secondPlayerTurnLabel.isHidden = false
        }
        
        gameViewController?.winnerLabel.isHidden = true
    }
    
    
    
    func addMark(at position: GameboardPosition) {
        guard let gameboardView = gameboardView, gameboardView.canPlaceMarkView(at: position) else { return }
        
        let markView: MarkView
        
        switch player {
        case .first:
            markView = XView()
        case .second:
            markView = OView()
        }
        
        gameboard?.setPlayer(player, at: position)
        gameboardView.placeMarkView(markView, at: position)
        isCompleted = true

    }
    
    
}
