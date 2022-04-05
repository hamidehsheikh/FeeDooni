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
            //Image(name: ImageSpecifier(coin.name))
            Image(ImageSpecifier(coin.name))
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            
            VStack (alignment: .leading, spacing: 3) {
                Text(coin.name)
                    .font(.title3)
                    .foregroundColor(Color("TextColor"))
                Text(coin.type.rawValue)
                    .font(.caption)
                    .foregroundColor(Color("TextLightGray"))
            }
            Spacer()
            
            VStack (alignment: .leading, spacing: 5) {
                HStack {
                    Image(systemName: "chevron.down")
                    if (coin.sell == "") || (coin.sell == nil) {
                        Text("N/A")
                    }
                    Text(coin.sell ?? "")
                }
                .foregroundColor(Color("TextRedColor"))
                HStack {
                    Image(systemName: "chevron.up")
                    if (coin.buy == "") || (coin.buy == nil) {
                        Text("N/A")
                    }
                    Text(coin.buy ?? "")
                }
                .foregroundColor(Color("TextGreenColor"))
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

func ImageSpecifier(_ CurrencyName: String) -> String {
    switch CurrencyName {
    case "Emami","Azadi","Azadi-nim", "Azadi-rob":
        return "goldCoin"
    case "Gold-Gram", "Gold-Mithghal", "Gold-Ounce":
        return "goldgram"
    case "Euro":
        return "euro"
    case "USD":
        return "dollar"
    case "Bitcoin":
        return "bitcoin"
    default:
        return "dollar"
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
