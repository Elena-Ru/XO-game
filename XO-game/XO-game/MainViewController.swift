//
//  ViewController.swift
//  XO-game
//
//  Created by Елена Русских on 06.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    var rootView = RootView()
    private let gameboard = Gameboard()
    private var currentState: GameState! {
        didSet {
            self.currentState.begin()
        }
    }
    private lazy var referee = Referee(gameboard: self.gameboard)
   
   override func loadView() {
       super.loadView()
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
        rootView.restartButton.addTarget(self, action: #selector(restartAction), for: .touchUpInside)
    }
    
    private func goToFirstState() {
        self.currentState = PlayerInputState(player: .first, gameVC: self, gameboard: gameboard, gameboardView: rootView.gameboardView)
    }
    
    private func goToNextState() {
        if let winner = self.referee.determineWinner() {
            self.currentState = GameEndedState(winner: winner, gameVC: self)
            return
        } else  if gameboard.friendshipCase() {
                self.currentState = GameEndedState(winner: nil, gameVC: self)
                return
        }

        if let playerInputState = currentState as? PlayerInputState {
            self.currentState = PlayerInputState(player: playerInputState.player.next, gameVC: self, gameboard: gameboard, gameboardView: rootView.gameboardView)
        }
    }
    
    @objc private func restartAction(){
        print("RESTART GAME ")
    }


}

