//
//  Episode.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/3/23.
//

import Foundation


struct Episode: Decodable {
    //MARK: - Properties
    
    let id: Int
    let title: String
    let excerpt: String
    
    let imageURL: URL
    
    let videoID: String
    let videoDuration: Int
}

extension Episode {
    static let episodes: [Episode] =  {
        guard let url = Bundle.main.url(forResource: "episodes", withExtension: "json") else {
            fatalError("Unable to Find Stub Data")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to Load Stub Data")
        }
        
        return try! JSONDecoder().decode([Episode].self, from: data)
    }()
}