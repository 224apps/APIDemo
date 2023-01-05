//
//  APIError.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/5/23.
//

import Foundation

enum APIError: Error {
    
    case unknown
    case unreachable
    case failedRequest
    case invalidResponse
    
    var message: String {
        switch self {
            case .unreachable:
                return "You need to have a network connection"
            case .unknown, .failedRequest, .invalidResponse:
                return "This list of episodes could not be fetched."
        }
    }
    
}
