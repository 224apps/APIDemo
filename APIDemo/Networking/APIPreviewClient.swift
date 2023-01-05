//
//  APIPreviewClient.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/5/23.
//

import Foundation
import Combine


struct APIPreviewClient: APIService {
    func episodes() -> AnyPublisher<[Episode], APIError> {
        guard let bundle = Bundle.main.url(forResource: "episodes", withExtension: "json"),
              let data = try? Data(contentsOf: bundle), let episodes = try? JSONDecoder().decode([Episode].self, from: data) else {
            fatalError("Unable to Load Episodes")
        }
        
        return Just(episodes)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
    
}
