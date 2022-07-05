//
//  PodcastCellViewModel.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import Foundation

protocol PodcastViewModelType {
    var artistName: String { get }
    var trackName: String { get }
    var artworkUrl: URL? { get }
}

struct PodcastCellViewModel : PodcastViewModelType {
    private let podcast: Podcast
    
    init(_ podcast: Podcast) {
        self.podcast = podcast
    }
    
    var artistName: String {
        //let's manipulate the string on presentation by adding an emoji
        return "⭐️" + podcast.artistName + "⭐️"
    }
    
    var trackName: String {
        return podcast.trackName
    }
    
    var artworkUrl: URL? {
        return URL.init(string: self.podcast.artworkUrl100)
    }
    
    
}
