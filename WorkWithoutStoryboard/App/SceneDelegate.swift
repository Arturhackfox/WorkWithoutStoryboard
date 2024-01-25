//
//  SceneDelegate.swift
//  WorkWithoutStoryboard
//
//  Created by Arthur Sh on 24.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // MARK: -  This window will serve as the main window for the app.
        
        window = UIWindow(windowScene: windowScene)
        
        // MARK: - Root view controller of the app
        
        let vc = ViewController()
        let nc = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
}
	
