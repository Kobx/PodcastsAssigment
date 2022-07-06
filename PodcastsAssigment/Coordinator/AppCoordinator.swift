//
//  AppCoordinator.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import UIKit

class AppCoordinator {
    private let window :UIWindow
    private let navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func loadRootVC() {
        let rootVC = SearchPodcastsVC.instantiate()
        navigationController.viewControllers = [rootVC]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func showPodcastDetailsVC(withViewModel viewModel:PodcastDetailsViewModel) {
        let podcastDetailsVC = PodcastDetailsVC.instantiate()
        podcastDetailsVC.viewModel = viewModel
        navigationController.pushViewController(podcastDetailsVC, animated: true)
    }
    

}
