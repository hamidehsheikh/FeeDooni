//
//  TopTabView.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import SwiftUI
//import UIKit

struct TopTabView: View {
    @State private var selectedItem = 0
//    let LightGray = UIColor(named: "LightGray")
//    let BlueText = UIColor(named: "BlueText")
//    let WhiteColor = UIColor(named: "WhiteColor")
    
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedItem) {
                Text("Currency").tag(0)
                Text("Crypto").tag(1)
                Text("Coin").tag(2)
            }
            .pickerStyle(.segmented)
            .onAppear {
//                UISegmentedControl.appearance()
//                    .tintColor = UIColor.white
//
//                UISegmentedControl.appearance()
//                    .selectedSegmentTintColor = LightGray
//
//                UISegmentedControl.appearance()
//                    .setTitleTextAttributes([.foregroundColor: Color.blue], for: .selected)
//
//                UISegmentedControl.appearance()
//                    .setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
            }
            Text("Selected Item: \(selectedItem)")
        }
    }
}

struct TopTabView_Previews: PreviewProvider {
    static var previews: some View {
        TopTabView()
            .previewLayout(.sizeThatFits)
    }
}
