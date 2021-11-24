//
//  ButtonsText.swift
//  TMNT Quiz Code
//
//  Created by Андрей on 24.11.2021.
//

import Foundation

enum FirstButtonText: String {
    case firstButton = "🧀"
    case secondButton = "🌶"
    case thirdButton = "🥓"
    case fourthButton = "🍤"
    case fifthButton = "🥦"
    case sixthButton = "🍄"
    case seventhbutton = "🐟"
    case eighthButton = "🦐"
}

struct SecondButtonsText {
    static let leftButton: String = {
        let list = ["Order sushi", "Filth 🤢", "I'm not hungry"].shuffled()
        return list[0]
    }()
    static let rightButton: String = "I ♥️ pizza"
}
