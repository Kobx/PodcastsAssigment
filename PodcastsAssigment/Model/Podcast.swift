//
//  Podcast.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import Foundation

struct Podcast: Codable {
    let artistName: String
    let trackName: String
    let artworkUrl100: String
    let releaseDate: Date
    
    enum CodingKeys: String, CodingKey {
        case artistName
        case trackName
        case artworkUrl100
        case releaseDate
    }
}
