//
//  RootView.swift
//  APIDemo
//
//  Created by Abdoulaye Diallo on 1/3/23.
//


import SwiftUI

struct RootView: View {
    
    // MARK: - Properties
    
    private let keychainService = KeychainService()
    
    // MARK: - View
    
    var body: some View {
        TabView {
            EpisodesView(viewModel: EpisodesViewModel(apiService: APIClient()))
                .tabItem {
                    Label("What's New", systemImage: "film")
                }
            ProfileView(viewModel: ProfileViewModel(keychainService: keychainService))
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
