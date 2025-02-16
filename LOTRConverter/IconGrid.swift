//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by yaxin on 2025-02-14.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency: Currency

    var body: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in
                if (currency == selectedCurrency) {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .shadow(color: .black, radius: 10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        }
                } else {
                    CurrencyIcon(currencyImage: currency.image, currencyName: currency.name)
                        .onTapGesture {
                            self.selectedCurrency = currency
                        }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currency: Currency = .copperPenny
    IconGrid(selectedCurrency: $currency)
}
