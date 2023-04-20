//
//  SceneDelegate.swift
//  Networking
//
//  Created by Олег Стригунов on 15.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScence = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScence)
                let vc = MainViewController()
                let navigationController = UINavigationController(rootViewController: vc)
     
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

