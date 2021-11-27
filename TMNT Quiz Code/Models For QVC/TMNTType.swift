//
//  TMNTType.swift
//  TMNT
//
//  Created by Андрей on 16.11.2021.
//

enum TMNTType: String {
    case donatello = "Донателло"
    case leonardo = "Леонардо"
    case michaelangelo = "Микеланджело"
    case raphael = "Рафаэль"
    
    var definition: String {
        switch self {
        case .donatello:
            return "Ты самый разумный черепах в этом болоте. По части дедукции не уступишь Шерлоку Холмсу. Стараешься избежать драки, но если придется, то противнику мало не покажется!"
        case .leonardo:
            return "Ты - безусловный лидер. Спокойствие и дисциплина, вот твои главные козыри. Своих друзей, коллег и родных ты всегда раскладываешь по полочкам - кто плохой, кто хороший."
        case .michaelangelo:
            return "Весельчак и любитель нунчак. Душа компании. Вроде бы всегда идешь по жизни смеясь, но если друзьям грозит беда - помогаешь на полном серьезе. А еще ты большой любитель пиццы!"
        case .raphael:
            return "Зануда. Приходилось слышать это слово? А прибавь к этому упрямство и вспыльчивость - главные черты твоего характера. Гремучая смесь! Заточи свои кинжалы и вперед, спасать мир!"
        }
    }
    
    var defititionImage: String {
        switch self {
        case .donatello:
            return "donatello@x1"
        case .leonardo:
            return "leonardo@x1"
        case .michaelangelo:
            return "michaelangelo@x1"
        case .raphael:
            return "raphael@x1"
        }
    }
}
