//
//  URLBuilder.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/3/23.
//

import UIKit

final class URLBuilder {
    //MARK: - Properties
    
    private let source: URL
    
    //MARK: -
    
    private var width: Int?
    private var height: Int?
    
    //MARK: - Initialization
    
    init(source: URL, width: Int? = nil, height: Int? = nil) {
        self.source = source
        self.width = width
        self.height = height
    }
    
    //MARK: - Public API
    
    func width(_ width: Int) -> URLBuilder {
        self.width = width
        return self
    }
    
    func height(_ height: Int) -> URLBuilder {
        self.height = height
        return self
    }
    
    func build() -> URL {
        // Helpers
        var parameters: [String] = []
        var url = Environment.cloudinaryBaseUrl

        if let width = width {
            parameters.append("w_\(width)")
        }

        if let height = height {
            parameters.append("h_\(height)")
        }

        // Define Format
        parameters.append("f_png")

        // Define Device Pixel Ratio
        let dpr = String(format: "%1.1f", UIScreen.main.scale)
        parameters.append("dpr_\(dpr)")

        // Append Parameters
        if !parameters.isEmpty {
            let parametersAsString = parameters.joined(separator: ",")
            url = url.appendingPathComponent(parametersAsString)
        }

        return url.appendingPathComponent(source.absoluteString)
    }
}
