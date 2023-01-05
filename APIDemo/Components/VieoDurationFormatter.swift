//
//  VieoDurationFormatter.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/3/23.
//

import Foundation

final class VideoDurationFormatter: DateComponentsFormatter {
    //MARK: - Initialization
    
    override init() {
        super.init()
        
        unitsStyle = .positional
        allowedUnits = [.minute, .second]
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        unitsStyle = .positional
        allowedUnits = [.minute, .second]
    }
}
