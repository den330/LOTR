//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by yaxin on 2025-02-14.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @Binding var topCurrency: Currency
    @Binding var bottomCurrency: Currency


    var body: some View {
        ZStack {
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack {
                Text("Select the currency you are starting with:")
                    .fontWeight(.bold)
                IconGrid(selectedCurrency: $topCurrency)
                
                Text("Select the currency you would like you convert to:")
                    .fontWeight(.bold)
                    .padding(.top)
                IconGrid(selectedCurrency: $bottomCurrency)
                
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
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .silverPenny
    @Previewable @State var bottomCurrency: Currency = .goldPiece
    SelectCurrency(topCurrency: $topCurrency, bottomCurrency: $bottomCurrency)
}
