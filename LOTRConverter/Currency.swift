//
//  Currency.swift
//  LOTRConverter
//
//  Created by yaxin on 2025-02-15.
//

import DeveloperToolsSupport

enum Currency: Double, CaseIterable, Identifiable {
        
    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
                .copperpenny
        case .goldPenny:
                .goldpenny
        case .goldPiece:
                .goldpiece
        case .silverPenny:
                .silverpenny
        case .silverPiece:
                .silverpiece
        }
    }
    
    var name: String {
        switch self {
        case .copperPenny:
            "Copper Penny"
        case .goldPenny:
            "Gold Penny"
        case .goldPiece:
            "Gold Piece"
        case .silverPenny:
            "Silver Penny"
        case .silverPiece:
            "Silver Piece"
        }
    }
    
    var id: Currency {
        self
    }
    
    func convert(to targetCurrency: Currency, with quantity: String) -> String {
        let ratio = targetCurrency.rawValue / self.rawValue
        guard let quantityValue = Double(quantity) else {
            return ""
        }
        let result = quantityValue * ratio
        return String(format: "%.2f", result)
    }
}
