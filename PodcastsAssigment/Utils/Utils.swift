//
//  Utils.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 06/07/2022.
//

import UIKit

class Utils {
    
    static func getCoordinator() -> AppCoordinator? {
        let scene = UIApplication.shared.connectedScenes.first
        if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
            return sd.appCoordinator
        }
        return nil
    }
    
}
