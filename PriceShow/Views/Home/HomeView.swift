//
//  HomeView.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: MainViewModel
    @State var SelectedTab = "currency"
    @State private var showToast: Bool = false
    

    var body: some View {
        VStack {
            TopTabView
            List {
                ForEach(vm.Currencies) { item in
                    if item.type.rawValue == SelectedTab {
                        ListItemView(coin: item)
                            .swipeActions {
                                Button {
                                    SaveUserDefaultsArray(with: item.name)
                                    self.showToast = true
                                } label: {
                                    Label("Bookmark", systemImage: "bookmark")
                                        .offset(y: showToast ? 0 : -700)
                                }
                                .tint(.accentColor)
                            }
                    }
                }
            }
            .listStyle(.plain)
       }
        .refreshable {
            vm.ReloadData()
        }
        .toast(message: "Bookmark added successfully",
               isShowing: $showToast,
               duration: Toast.short)
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Dev.MainVM)
    }
}

// MARK: - UserDefaults

func SaveUserDefaultsArray(with Name: String) {
    
    if UserDefaults.standard.array(forKey: "myBM") != nil {
        var BookmarksArray = UserDefaults.standard.array(forKey: "myBM") as! [String]
        if !BookmarksArray.contains(Name) {
            BookmarksArray.append(Name)
            UserDefaults.standard.removeObject(forKey: "myBM")
            UserDefaults.standard.set(BookmarksArray, forKey: "myBM")
        }
    } else {
        let BookmarksArray: [String] = [Name]
        UserDefaults.standard.set(BookmarksArray, forKey: "myBM")
    }
    
}


// MARK: - TopTabView Extension

extension HomeView {
        
    private var TopTabView: some View {
        VStack {
            Picker("", selection: $SelectedTab) {
                Text("Currency").tag("currency")
                Text("Crypto").tag("crypto")
                Text("Gold").tag("gold")
            }
            .pickerStyle(.segmented)
        }
    }
}
