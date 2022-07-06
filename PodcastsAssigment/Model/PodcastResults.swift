//
//  PodcastResult.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 06/07/2022.
//

import Foundation

struct PodcastResults: Codable {
    let resultCount: Int
    let results: [Podcast]
}
