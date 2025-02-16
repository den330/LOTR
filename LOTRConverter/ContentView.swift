//
//  ContentView.swift
//  LOTRConverter
//
//  Created by yaxin on 2025-02-12.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    @FocusState var isleftFocused: Bool
    @FocusState var isRightFocused: Bool
    
    @State var leftCurrency: Currency = .goldPenny
    @State var rightCurrency: Currency = .goldPiece
    
    let currencyTip = CurrencyTip()
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                HStack {
                    VStack {
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            currencyTip.invalidate(reason: Tips.InvalidationReason.actionPerformed)
                            showSelectCurrency.toggle()
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($isleftFocused)
                    }
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    VStack {
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($isRightFocused)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .symbolEffect(.bounce)
                    }
                    .padding(.trailing)
                }
                
            }
        }
        .onChange(of: leftAmount) {
            if isleftFocused {
                rightAmount = leftCurrency.convert(to: rightCurrency, with: leftAmount)
            }
        }
        .onChange(of: rightAmount) {
            if isRightFocused {
                leftAmount = rightCurrency.convert(to: leftCurrency, with: rightAmount)
            }
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftCurrency) {
            leftAmount = rightCurrency.convert(to: leftCurrency, with: rightAmount)
        }
        .onChange(of: rightCurrency) {
            rightAmount = leftCurrency.convert(to: rightCurrency, with: leftAmount)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
