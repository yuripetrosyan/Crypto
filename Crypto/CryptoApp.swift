//
//  CryptoApp.swift
//  Crypto
//
//  Created by Yuri Petrosyan on 26/11/2024.
//

import SwiftUI

@main
struct CryptoApp: App {
    var body: some Scene {
        WindowGroup {
            
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
