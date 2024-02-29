//
//  MainViewController.swift
//  XO-game
//
//  Created by Елена Русских on 08.12.2022.
//

import UIKit

// MARK: - MainViewController
final class MainViewController: UIViewController {

    // MARK: Properties
    let rootView = MainRootView()
    var presenter: MainViewOutput?
    
    // MARK: Lifecycle
    override func loadView() {
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
    }

    // MARK: Private Methods
    private func setupTargets() {
        rootView.gameWithPCButton.addTarget(self, action: #selector(gameWithPC), for: .touchUpInside)
        rootView.gameWithHumanButton.addTarget(self, action: #selector(gameWithHuman), for: .touchUpInside)
        rootView.blindGameButton.addTarget(self, action: #selector(blindGame), for: .touchUpInside)
    }
    
    // MARK: Objc Methods
    @objc
    func gameWithPC() {
        presenter?.didSelectGameWithPC()
    }
    
    @objc
    func gameWithHuman() {
        presenter?.didSelectGameWithHuman()
    }
    
    @objc
    func blindGame() {
        presenter?.didSelectBlindGame()
    }
}

// MARK: - MainViewInput
extension MainViewController: MainViewInput {
    func presentGameViewController(gameMode: GameMode) {
        let vc = GameViewController()
        vc.gameMode = gameMode
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}
