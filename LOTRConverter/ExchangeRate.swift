//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by yaxin on 2025-02-14.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let rightImage: ImageResource
    let text: String
    var body: some View {
        HStack {
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            Text("\(text)")
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpenny, rightImage: .goldpiece, text: "1 gold penny = 4 gold piece")
}
