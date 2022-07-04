//
//  Podcast.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import Foundation

//struct Podcast: Codable {
//    let artistName: String
//    let trackName: String
//    let artworkUrl100: String
//
//    enum CodingKeys: String, CodingKey {
//        case artistName
//        case trackName
//        case artworkUrl100
//    }
//
    
    
    struct Podcast: Codable {
        let wrapperType, kind: String
        let collectionID, trackID: Int
        let artistName, collectionName, trackName, collectionCensoredName: String
        let trackCensoredName: String
        let collectionViewURL: String
        let feedURL: String
        let trackViewURL: String
        let artworkUrl30, artworkUrl60, artworkUrl100: String
        let collectionPrice, trackPrice, trackRentalPrice, collectionHDPrice: Int
        let trackHDPrice, trackHDRentalPrice: Int
        let releaseDate: Date
        let collectionExplicitness, trackExplicitness: String
        let trackCount: Int
        let country, currency, primaryGenreName, contentAdvisoryRating: String
        let artworkUrl600: String
        let genreIDS, genres: [String]
        let artistID: Int?
        let artistViewURL: String?

        enum CodingKeys: String, CodingKey {
            case wrapperType, kind
            case collectionID = "collectionId"
            case trackID = "trackId"
            case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
            case collectionViewURL = "collectionViewUrl"
            case feedURL = "feedUrl"
            case trackViewURL = "trackViewUrl"
            case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, trackRentalPrice
            case collectionHDPrice = "collectionHdPrice"
            case trackHDPrice = "trackHdPrice"
            case trackHDRentalPrice = "trackHdRentalPrice"
            case releaseDate, collectionExplicitness, trackExplicitness, trackCount, country, currency, primaryGenreName, contentAdvisoryRating, artworkUrl600
            case genreIDS = "genreIds"
            case genres
            case artistID = "artistId"
            case artistViewURL = "artistViewUrl"
        }
    }

