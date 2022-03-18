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
        BottomTabView()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Dev.MainVM)
    }
}
