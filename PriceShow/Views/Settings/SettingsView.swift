//
//  SettingsView.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import SwiftUI

struct SettingsView: View {
    @State var selected = 0
    
    var body: some View {
        VStack {
            Text("Username:")
            HStack {
                Text("Color Theme:")
                Picker("Color Theme:",selection: $selected) {
                    Text("Red")
                        .tag(0)
                    Text("Blue")
                        .tag(1)
                }
                .pickerStyle(.menu)
            }
                
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
