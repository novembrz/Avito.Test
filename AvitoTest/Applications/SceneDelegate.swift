//
//  SceneDelegate.swift
//  AvitoTest
//
//  Created by Дарья on 21.01.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let mainVC = ProductsConfigurator.createMainVC()
        window?.rootViewController = mainVC
        window?.makeKeyAndVisible()
    }
    
    /*
     func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
  
         guard let windowScene = (scene as? UIWindowScene) else { return }
         window = UIWindow(frame: windowScene.coordinateSpace.bounds)
         window?.windowScene = windowScene
         let vc = ChooseAdOptionsRouter.createModule()
         window?.rootViewController = vc
         window?.makeKeyAndVisible()
     }
     */
}

