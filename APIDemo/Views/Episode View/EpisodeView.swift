//
//  EpisodeView.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/3/23.
//

import SwiftUI

struct EpisodeView: View {
    //MARK: - Properties
    let viewModel: EpisodeViewModel
    
    //MARK: -
    @State private var showVideo = false
    
    //MARK: - View
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(viewModel: EpisodeViewModel(episode: Episode.episodes[0]))
    }
}

