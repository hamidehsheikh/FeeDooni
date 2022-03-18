//
//  BookmarksView.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import SwiftUI

struct BookmarksView: View {
    var body: some View {
        VStack {
             TopTabView()
             List {
                 ListItemView(coin: DeveloperPreview.instance.SampleData)

                
             }
             .listStyle(.plain)
        }
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
    }
}
