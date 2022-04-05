//
//  SettingsView.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack {
            List {
                Section {
                    Picker("Select the theme color:", selection: $selectedColor) {
                        Text("Pink")
                            .tag(Color.pink)
                        Text("Blue")
                            .tag(Color.blue)
                        Text("Green")
                            .tag(Color.green)
                    }
                    .pickerStyle(InlinePickerStyle())
                    
                } header: {
                    Text("Color Settings")
                }
                                
                Section {
                } header: {
                    Text("About the app")
                } footer: {
                    Text("This app has been published by Hamideh Sheikh in March 2022")
                }

            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
        
    static var previews: some View {
        SettingsView(selectedColor: .constant(.pink))
    }
}
