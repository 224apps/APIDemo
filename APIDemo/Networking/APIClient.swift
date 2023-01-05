//
//  APIClient.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/5/23.
//

import Foundation
import Combine

final class APIClient: APIService {
    
    func episodes() -> AnyPublisher<[Episode], APIError> {
        var request = URLRequest(url: Environment.apiBaseURL.appendingPathComponent("episodes"))
        request.addValue(Environment.apiToken, forHTTPHeaderField: "X-API-TOKEN")
       
         return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap({ data, response -> [Episode] in
                guard let response = response as? HTTPURLResponse,
                (200..<300).contains(response.statusCode) else { throw APIError.failedRequest }
                do {
                    return try JSONDecoder().decode([Episode].self, from: data)
                } catch  {
                    print("Unable to Decode Response \(error)")
                    throw APIError.invalidResponse
                }
            })
            .mapError({error -> APIError in
                switch error {
                    case let apiError as APIError:
                        return apiError
                    case URLError.notConnectedToInternet:
                        return  APIError.unreachable
                    default:
                        return APIError.failedRequest
                }
                
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
}
