//
//  ProfileViewModel.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/3/23.
//

import Combine
import Foundation

final class ProfileViewModel: ObservableObject {

    // MARK: - Properties

    @Published private(set) var isSignedIn = false

    // MARK: -

    let keychainService: KeychainService

    // MARK: -

    private var subscriptions: Set<AnyCancellable> = []

    // MARK: - Initialization

    init(keychainService: KeychainService) {
        self.keychainService = keychainService
        
        setupBindings()
    }

    // MARK: - Public API

    func signOut() {
        keychainService.resetAccessToken()
        keychainService.resetRefreshToken()
    }

    // MARK: - Helper Methods

    private func setupBindings() {
        keychainService.$accessTokenPublisher
            .map { $0 != nil }
            .assign(to: &$isSignedIn)
    }

}
