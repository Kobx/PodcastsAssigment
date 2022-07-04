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
        //return a URL from the url string
//        return URL.init(string: self.podcast.artworkUrl100)
        return URL.init(string: "https://is5-ssl.mzstatic.com/image/thumb/Podcasts125/v4/ac/c4/c7/acc4c703-ae45-af83-5f51-ef4909ad6f3e/mza_13790432082240724320.jpg/100x100bb.jpg")
    }
    
    
}
