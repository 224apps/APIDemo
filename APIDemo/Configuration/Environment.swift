//
//  Environment.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/3/23.
//

import Foundation

enum Environment {

    // MARK: - Cloudinary Base URL

    static var cloudinaryBaseUrl: URL {
        URL(string: "https://res.cloudinary.com/cocoacasts/image/fetch/")!
    }

}
