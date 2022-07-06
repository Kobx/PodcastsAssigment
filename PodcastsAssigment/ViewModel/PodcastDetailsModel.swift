//
//  PodcastCellViewModel.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import Foundation

protocol PodcastDetailsViewModelType {
    var artistName: String { get }
    var trackName: String { get }
    var artworkUrl: URL? { get }
    var releaseDate: String { get }
}

struct PodcastDetailsViewModel : PodcastDetailsViewModelType {
    private let podcast: Podcast
    
    init(_ podcast: Podcast) {
        self.podcast = podcast
    }
    
    var artistName: String {
        return podcast.artistName
    }
    
    var trackName: String {
        return podcast.trackName
    }
    var releaseDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: podcast.releaseDate)
    }
    
    var artworkUrl: URL? {
        return URL.init(string: self.podcast.artworkUrl100)
    }
    
    
}
