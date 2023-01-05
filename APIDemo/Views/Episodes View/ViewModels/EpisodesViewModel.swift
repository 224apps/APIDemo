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
    
    @Published var errorMessage: String?
    //MARK: -
    
    var episodeRowViewModels: [EpisodeRowViewModel] {
        return episodes.map { EpisodeRowViewModel(episode: $0)}
    }
    
    private let apiService: APIService
    
    //MARK: -
    private var subscriptions: Set<AnyCancellable> = []
    
    //MARK: - Initialization
    
    init( apiService: APIService){
        self.apiService = apiService
        fetchEpisodes()
    }
    
    //MARK: - Helper Methods
    
    private func fetchEpisodes() {
        isFetching = true
        
        apiService.episodes()
            .sink(receiveCompletion: { [weak self] completion in
                self?.isFetching = false
                
                switch completion {
                    case .finished:
                        ()
                    case .failure(let error):
                        print("Unable to Fetch Episodes \(error)")
                        self?.errorMessage = error.message
                }
            }, receiveValue: { [weak self] episodes in
                self?.episodes = episodes
            }).store(in: &subscriptions)
        
    }
}
