//
//  BookmarksView.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import SwiftUI

struct BookmarksView: View {
    
    @EnvironmentObject private var vm: MainViewModel
    var SavedArray = UserDefaults.standard.stringArray(forKey: "myBM") ?? [""]
        
    var body: some View {
        VStack {
            List {
                let TempArr = GetSavedCurrency(Names: SavedArray, arr: vm.Currencies)
                ForEach(TempArr) { item in
                    ListItemView(coin: item)
                        .swipeActions {
                            Button {
                                print("Bookmark Removed!")
                            } label: {
                                Label("Remove", systemImage: "bookmark.slash")
                            }
                            .tint(.accentColor)
                        }
                }
            }
            .listStyle(.plain)
        }
    }
}


// MARK: - Get saved currencies from UserDefaults

func GetSavedCurrency(Names: [String], arr: [UnitData]) -> [UnitData] {
    
    let SavedArray = UserDefaults.standard.stringArray(forKey: "myBM") ?? [""]
    var output: [UnitData] = []
    
    for item in SavedArray {
        for VMitem in arr {
            if (VMitem.name == item) {
                output.append(VMitem)
                print(output)
            }
        }
    }
    return output
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
    }
}


