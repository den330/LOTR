//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by yaxin on 2025-02-14.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                
                CurrencyIcon(currencyImage: .copperpenny, currencyName: "Copper Penny")
                
                Text("Select the currency you would like you convert to:")
                    .fontWeight(.bold)
                
                Button("Done") {
                    dismiss()
                }
                .foregroundStyle(.white)
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency()
}
