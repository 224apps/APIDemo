//
//  EpisodesViewModel.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/3/23.
//

import Foundation
import Combine

final class EpisodesViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published private(set) var episodes: [Episode] = []
    @Published private(set) var isFetching = false
    
    //MARK: -
    
    var episodeRowViewModels: [EpisodeRowViewModel] {
        return episodes.map { EpisodeRowViewModel(episode: $0)}
    }
    
    //MARK: -
    private var subscriptions: Set<AnyCancellable> = []
    
    //MARK: - Initialization
    
    init(){
        fetchEpisodes()
    }
    
    //MARK: - Helper Methods
    
    private func fetchEpisodes(){
        guard let url = Bundle.main.url(forResource: "episodes", withExtension: "json"),
        let data = try? Data(contentsOf: url),
        let episodes = try? JSONDecoder().decode([Episode].self, from:data) else { return  }
        
        self.episodes = episodes
        
    }
}
