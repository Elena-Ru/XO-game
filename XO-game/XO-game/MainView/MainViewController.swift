//
//  MainViewController.swift
//  XO-game
//
//  Created by Елена Русских on 08.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    var rootView = MainRootView()
    
    override func loadView() {
        super.loadView()
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.gameWithPCButton.addTarget(self, action: #selector(gameWithPC), for: .touchUpInside)
        rootView.gameWithHumanButton.addTarget(self, action: #selector(gameWithHuman), for: .touchUpInside)
    }

    @objc func gameWithPC () {
        print("Game with AI")
        let vc = GameViewController()
        vc.gameMode = .withAI
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    
    @objc func gameWithHuman () {
        print("Game with human")
        let vc = GameViewController()
        vc.gameMode = .withHuman
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
}
