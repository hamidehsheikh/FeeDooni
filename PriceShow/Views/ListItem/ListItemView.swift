//
//  ListItemView.swift
//  PriceShow
//
//  Created by Hamideh Sheikh on 3/13/22.
//

import SwiftUI

struct ListItemView: View {
    let coin: UnitData
    let BtnBackColor = Color("BtnBackColor")
    
    var body: some View {
        HStack (spacing: 10) {
            Image(systemName: coin.Image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
            
            VStack (alignment: .leading, spacing: 3) {
                Text(coin.id)
                    .font(.title3)
                    .foregroundColor(.black)
                Text("Increased")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            VStack (spacing: 5) {
                HStack {
                    Image(systemName: "chevron.down")
                    Text(coin.SellPrice.asCurrencyWith2Decimals())
                }
                .foregroundColor(.red)
                HStack {
                    Image(systemName: "chevron.up")
                    Text(coin.BuyPrice.asCurrencyWith2Decimals())
                }
                .foregroundColor(.green)
            }
            .font(.subheadline)
        }
        .padding(10)
        .background(BtnBackColor)
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.2), radius: 10)
        .listRowSeparator(.hidden)
        .padding(3)
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListItemView(coin: Dev.SampleData)
               .previewLayout(.sizeThatFits)
            ListItemView(coin: Dev.SampleData)
               .previewLayout(.sizeThatFits)
               .preferredColorScheme(.dark)
        }

    }
}
