//
//  ViewController.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

// MARK: - GameViewController
final class GameViewController: UIViewController {

    // MARK: Properties
    var rootView = RootView()
    var gameMode: GameMode = .withHuman
    private lazy var gameboard = Gameboard()
    private var currentState: GameState! {
        didSet {
            self.currentState.begin()
        }
    }
    private lazy var referee = Referee(gameboard: self.gameboard)
    
    // MARK: Lyfecycle
    override func loadView() {
        view = rootView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.goToFirstState()
        view.backgroundColor = .white
        rootView.gameboardView.onSelectPosition = { [weak self] position in
            guard let self = self else { return }
            self.currentState.addMark(at: position)
            if self.currentState.isCompleted {
                self.goToNextState()
            }
        }
        rootView.nextButton.addTarget(self, action: #selector(nextStepAction), for: .touchUpInside)
        rootView.restartButton.addTarget(self, action: #selector(restartAction), for: .touchUpInside)
    }
    
    // MARK: Methods
    private func goToFirstState() {
        let player = Player.first
        switch gameMode {
        case .withHuman, .withAI:
            self.currentState = PlayerInputState(player: .first, markViewPrototype: player.markViewPrototype , gameVC: self, gameboard: gameboard, gameboardView: rootView.gameboardView)
        case .blindGame:
            self.currentState = PlayerInputBGState(player: .first, markViewPrototype: player.markViewPrototype , gameVC: self, gameboard: gameboard, count: 0, gameboardView: rootView.gameboardView)
        }
    }
    
    func goToNextState() {
        switch gameMode {
        case .withHuman:
            guard !isEndGame() else { return }
            
            if let playerInputState = currentState as? PlayerInputState {
                let player = playerInputState.player.next
                self.currentState = PlayerInputState(
                    player: player,
                    markViewPrototype: player.markViewPrototype,
                    gameVC: self,
                    gameboard: gameboard,
                    gameboardView: rootView.gameboardView)
            }
        case .withAI:
            guard !isEndGame() else { return }
        
            if let playerInputState = currentState as? PlayerInputState {
                let player = playerInputState.player.next
                self.currentState = AIInputState(
                    isCompleted: false,
                    markViewPrototype: player.markViewPrototype,
                    player: player,
                    gameVC: self,
                    gameboard: gameboard,
                    gameboardView: rootView.gameboardView)
            }
            
           if let playerInputState = currentState as? AIInputState {
               let player = playerInputState.player.next
               self.currentState = PlayerInputState(
                   player: player,
                   markViewPrototype: player.markViewPrototype,
                   gameVC: self,
                   gameboard: gameboard,
                   gameboardView: rootView.gameboardView)
           }
        case .blindGame:
            if let playerInputState = currentState as? PlayerInputBGState {
                var player = playerInputState.player
                var prototype = player.markViewPrototype
                if playerInputState.count < 5 {
                    self.currentState = PlayerInputBGState(
                        player: player,
                        markViewPrototype: prototype,
                        gameVC: self,
                        gameboard: gameboard,
                        count: playerInputState.count,
                        gameboardView: rootView.gameboardView)
                } else {
                    rootView.gameboardView.clear()
                    player = player.next
                    prototype = player.markViewPrototype
                    if playerInputState.player == .second {
                        self.currentState = BlindGameState(
                            player: player,
                            markViewPrototype: prototype,
                            gameVC: self,
                            gameboard: gameboard,
                            gameboardView: rootView.gameboardView)
                    } else {
                        self.currentState = PlayerInputBGState(
                            player: player,
                            markViewPrototype: prototype,
                            gameVC: self,
                            gameboard: gameboard,
                            count: 0,
                            gameboardView: rootView.gameboardView)
                    }
                }
            } else if let playerInputState = currentState as? BlindGameState {
                guard !isEndGame() else { return }
                
                let player = playerInputState.player.next
                self.currentState = BlindGameState(
                    player: player,
                    markViewPrototype: player.markViewPrototype,
                    gameVC: self,
                    gameboard: gameboard,
                    gameboardView: rootView.gameboardView)
            }
        }
    }
    
    private func isEndGame() -> Bool {
        if let winner = self.referee.determineWinner() {
            self.currentState = GameEndedState(winner: winner, gameVC: self)
            return true
        } else  if gameboard.friendshipCase() {
                self.currentState = GameEndedState(winner: nil, gameVC: self)
                return true
        }
        return false
    }
    
    // MARK: Objc Methods
    @objc
    private func restartAction(){
        log(.restartGame)
        gameboard.clear()
        rootView.gameboardView.clear()
        rootView.nextButton.isHidden = true
        gameboard.firstPlayerpositions = []
        gameboard.secondPlayerpositions = []
        self.goToFirstState()
    }
    
    @objc 
    private func nextStepAction(){
        if self.currentState.isCompleted {
            self.goToNextState()
        }
    }
}

