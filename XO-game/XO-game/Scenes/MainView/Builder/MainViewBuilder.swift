//
//  MainViewBuilder.swift
//  XO-game
//
//  Created by Елена Русских on 2024-01-22.
//

import UIKit

// MARK: - MainViewBuilder
final class MainViewBuilder {
    static func build() -> UIViewController {
        let view = MainViewController()
        let presenter = MainViewPresenter()
        view.presenter = presenter
        presenter.viewController = view
        return UINavigationController(rootViewController: view)
    }
}

