import Foundation
import RxSwift
import RxCocoa


public enum RequestType: String {
    case GET, POST
}

protocol APIRequest {
    var method: RequestType { get }
    var path: String { get }
    var parameters: [String : String] { get }
}

class PodcastsRequest: APIRequest {
    var method = RequestType.GET
    var path = "search"
    var parameters = [String: String]()

    init(searchString: String) {
        parameters["term"] = searchString
        parameters["entity"] = "podcast"
    }
}

extension APIRequest {
    func request(with baseURL: URL) -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }

        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }

        guard let url = components.url else {
            fatalError("Could not get url")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}



class APIClient {
    private let baseURL = URL(string: "https://itunes.apple.com/")!

    func send(apiRequest: APIRequest) -> Observable<[Podcast]> {
        let request = apiRequest.request(with: baseURL)
        return URLSession.shared.rx.data(request: request)
            .map {
                let podcastsArray = try self.newJSONDecoder().decode(PodcastResults.self, from: $0).results
                return podcastsArray
            }
    }
    
    func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}


