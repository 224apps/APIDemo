//
//  EpisodeViewModel.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/3/23.
//

import UIKit
import Foundation

final class EpisodeViewModel: ObservableObject {

    // MARK: - Properties

    private let episode: Episode

    // MARK: -

    var title: String {
        episode.title
    }

    var excerpt: String {
        episode.excerpt
    }

    var videoID: String {
        episode.videoID
    }

    @Published private(set) var image: UIImage?

    // MARK: -

    private(set) lazy var formattedVideoDuration: String? = {
        VideoDurationFormatter().string(
            from: TimeInterval(episode.videoDuration)
        )
    }()

    // MARK: -

    private var url: URL {
        URLBuilder(source: episode.imageURL)
            .width(50)
            .height(50)
            .build()
    }

    // MARK: - Initialization

    init(episode: Episode) {
        self.episode = episode

        fetchImage()
    }

    // MARK: - Helper Methods

    private func fetchImage() {
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }.resume()
    }

}
