//
//  SceneDelegate.swift
//  dogsList
//
//  Created by Idwall Go Dev 012 on 10/04/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let dogListController =  DogListController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = UINavigationController(rootViewController: dogListController)
        window?.makeKeyAndVisible()
    }
}

