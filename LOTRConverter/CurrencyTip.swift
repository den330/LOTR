//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by yaxin on 2025-02-16.
//

import TipKit

struct CurrencyTip: Tip {
    var title: Text {
        Text("Change Currency")
    }
    var message: Text? {
        Text("You can tap the left or right currency to bring up the Select Currency screen")
    }
    var image: Image? {
        Image(systemName: "hand.tap.fill")
    }
}
