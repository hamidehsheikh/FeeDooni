//
//  MainView.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var vm: MainViewModel
    @State var appColor: Color = Color.pink
    
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
                //.tag(0)
                //.highPriorityGesture(DragGesture().onEnded({ self.handleSwipe(translation: $0.translation.width)}))
            BookmarksView()
                .tabItem { Label("Bookmarks", systemImage: "bookmark") }
                //.tag(1)
                //.highPriorityGesture(DragGesture().onEnded({ self.handleSwipe(translation: $0.translation.width)}))
            SettingsView(selectedColor: $appColor)
                .tabItem { Label("Settings", systemImage: "gearshape") }
                //.tag(2)
                //.highPriorityGesture(DragGesture().onEnded({ self.handleSwipe(translation: $0.translation.width)}))
        }
        .accentColor(appColor)
    }
    
//    func handleSwipe(translation: CGFloat) {
//
//        let numTabs = 2
//        let minDragTranslationForSwipe: CGFloat = 50
//
//        if translation > minDragTranslationForSwipe && selectedTab > 0 {
//            selectedTab -= 1
//        } else  if translation < -minDragTranslationForSwipe && selectedTab < numTabs-1 {
//            selectedTab += 1
//        }
//    }
}


