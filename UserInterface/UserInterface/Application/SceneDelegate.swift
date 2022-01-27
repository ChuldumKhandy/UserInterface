//
//  SceneDelegate.swift
//  UserInterface
//
//  Created by user on 26.01.2022.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else {
            return }
        let window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController(rootViewController: LogInAssembly.build())
        window.rootViewController = navigationController
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

