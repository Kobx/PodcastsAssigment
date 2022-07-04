//
//  AppCoordinator.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import UIKit

class AppCoordinator {
    private let window :UIWindow
    
    func stat() {
        let mainVC = MainViewController.instantiate()
        let navigationController = UINavigationController.init(rootViewController: mainVC)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        
    }
    
    
    init(window: UIWindow) {
        self.window = window
    }
}
