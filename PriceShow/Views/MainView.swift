//
//  MainView.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var vm: MainViewModel
    
    var body: some View {
        BottomTabView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Dev.MainVM)
            .accentColor(.pink)
    }
}

extension MainView {
    
    private var BottomTabView: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            BookmarksView()
                .tabItem { Label("Bookmarks", systemImage: "bookmark") }
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
        .accentColor(.pink)
    }
}
