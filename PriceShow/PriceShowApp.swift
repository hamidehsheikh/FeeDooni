//
//  PriceShowApp.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import SwiftUI

@main
struct PriceShowApp: App {
    @StateObject private var vm = MainViewModel()
    @StateObject var TopTab = TopTabViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(vm)
                .environmentObject(TopTab)
        }
    }
}
