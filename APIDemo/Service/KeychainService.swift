//
//  KeychainService.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/3/23.
//

import Combine
import Foundation
import KeychainAccess

final class KeychainService {
    
    //MARK: - Keys
    
    private enum Keys {
        static let accessToken = "accessToken"
        static let refreshToken = "refreshToken"
    }
    
    //MARK: - Proprieties
    
    private let apidemo = Keychain(service: "com.APIDemo")
    
    // MARK: - Access Token

    @Published private(set) var accessTokenPublisher: String?
    
    var accessToken: String? {
        accessTokenPublisher
    }
    
    func setAccessToken(_ accessToken: String) {
        accessTokenPublisher = accessToken
    }
    
    func resetAccessToken() {
        accessTokenPublisher = nil
    }
    
    // MARK: - Refresh Token

    @Published private(set) var refreshTokenPublisher: String?

    var refreshToken: String? {
        refreshTokenPublisher
    }

    func setRefreshToken(_ refreshToken: String) {
        refreshTokenPublisher = refreshToken
    }

    func resetRefreshToken() {
        refreshTokenPublisher = nil
    }
    
    // MARK: -

    private var subscriptions: Set<AnyCancellable> = []

    // MARK: - Initialization

    init() {
        accessTokenPublisher = apidemo[Keys.accessToken]
        refreshTokenPublisher = apidemo[Keys.refreshToken]

        setupBindings()
    }

    // MARK: - Helper Methods

    private func setupBindings() {
        $accessTokenPublisher
            .sink(receiveCompletion: { _ in
                ()
            }, receiveValue: { [weak self] accessToken in
                if let accessToken = accessToken {
                    self?.apidemo[Keys.accessToken] = accessToken
                } else {
                    do {
                        try self?.apidemo.remove(Keys.accessToken)
                    } catch {
                        print("Unable to Remove Access Token from Keychain \(error)")
                    }
                }
            }).store(in: &subscriptions)

        $refreshTokenPublisher
            .sink(receiveCompletion: { _ in
                ()
            }, receiveValue: { [weak self] refreshToken in
                if let accessToken = refreshToken {
                    self?.apidemo[Keys.refreshToken] = accessToken
                } else {
                    do {
                        try self?.apidemo.remove(Keys.refreshToken)
                    } catch {
                        print("Unable to Remove Refresh Token from Keychain \(error)")
                    }
                }
            }).store(in: &subscriptions)
    }
}
