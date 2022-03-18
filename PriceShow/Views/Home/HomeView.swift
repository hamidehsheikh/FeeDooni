//
//  HomeView.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: MainViewModel
    
    var body: some View {
        VStack {
            TopTabView()
            List {
                ForEach(vm.Currencies) { item in
                    ListItemView(coin: item)
                }
            }
            .listStyle(.plain)
            //.transition(.move(edge: .top))
       }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
