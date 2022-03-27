//
//  TopTabViewModel.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/19/22.
//

import Foundation

class TopTabViewModel: ObservableObject {
    
    @Published var selectedTab: Int = 0
    
    init() {
        //DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            //self?.selectedTab = 2
        //}
    }
}
