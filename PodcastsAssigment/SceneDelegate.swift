//
//  SceneDelegate.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        appCoordinator = AppCoordinator.init(window: window)
        appCoordinator?.loadRootVC()
    }

}

