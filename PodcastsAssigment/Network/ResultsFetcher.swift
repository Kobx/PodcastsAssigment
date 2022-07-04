//
//  ResultsFetcher.swift
//  PodcastsAssigment
//
//  Created by Koby Shirazi on 04/07/2022.
//

import Foundation


struct PodcastResults: Codable {
    let resultCount: Int
    let results: [Podcast]
}


class ResultsFetcher: URLSession {
    
    func fetchPodcastsResults(forString searchString: String) {
        let urlString = "https://itunes.apple.com/search?term=" + searchString + "&entity=podcast"
        let url = URL.init(string: urlString)
        
        guard let url = url else {
            print("fetch URL is invalid for string:" + urlString)
            return
        }
        
        // Asynchronous Http call to your api url, using URLSession:
        URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            if let data = data, error == nil{
                    let podcastResults = try? newJSONDecoder().decode(PodcastResults.self, from: data)
                    //TODO: Auto reload using RXSwift
                    print(podcastResults.debugDescription)
            }else {
                print("fetched data is invalid for string:" + urlString)
            }
        }.resume()
    }
}


// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func podcastResultsTask(with url: URL, completionHandler: @escaping (PodcastResults?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}


// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
