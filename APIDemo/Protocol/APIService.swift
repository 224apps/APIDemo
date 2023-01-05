//
//  APIService.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/5/23.
//

import Foundation
import Combine

protocol APIService {
    func episodes() -> AnyPublisher<[Episode], APIError>
}
