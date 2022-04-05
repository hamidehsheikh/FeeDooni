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
    @State private var showToast: Bool = false
        
    var body: some View {
        
        VStack {
            List {
                let TempArr = GetSavedCurrency(Names: SavedArray, arr: vm.Currencies)
                ForEach(TempArr) { item in
                    ListItemView(coin: item)
                        .swipeActions {
                            Button {
                                RemoveUserDefaultsArray(with: item.name)
                                //print("userDefaults bookmark pageee: \(UserDefaults.standard.array(forKey: "myBM") as! [String])")
                                vm.ReloadData()
                                self.showToast = true
                            } label: {
                                Label("Remove", systemImage: "bookmark.slash")
                            }
                            .tint(.accentColor)
                        }
                        
                }
            }
            .listStyle(.plain)
        }
        .refreshable {
            vm.ReloadData()
        }
        .onAppear {
            vm.ReloadData()
        }
        .toast(message: "Bookmark removed",
               isShowing: $showToast,
               duration: Toast.short)
    }
}

// MARK: - Remove Instant Array from UserDefaults

func RemoveUserDefaultsArray(with Name: String){
    
    if UserDefaults.standard.array(forKey: "myBM") != nil {
        var BookmarksArray = UserDefaults.standard.array(forKey: "myBM") as! [String]
        if BookmarksArray.contains(Name) {
            let indexOfName = BookmarksArray.firstIndex(of: Name)
            BookmarksArray.remove(at: indexOfName!)
            UserDefaults.standard.removeObject(forKey: "myBM")
            UserDefaults.standard.set(BookmarksArray, forKey: "myBM")
        }
    } else {
        let BookmarksArray: [String] = [Name]
        UserDefaults.standard.set(BookmarksArray, forKey: "myBM")
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


