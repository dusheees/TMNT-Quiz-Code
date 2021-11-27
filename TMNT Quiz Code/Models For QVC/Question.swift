//
//  Question.swift
//  TMNT
//
//  Created by Андрей on 16.11.2021.
//

struct Question {
    let text: String
    let type: ResponseType
    var answers: [Answer]
    let isShuffled: Bool
    
    static var all: [Question] = [
        Question(text: "Что тебе помогает выходить из стрессовых ситуаций ?", type: .singleButtons, answers: [
            Answer(text: "Немного везения", type: .donatello, image: nil),
            Answer(text: "Горячее сердце", type: .leonardo, image: nil),
            Answer(text: "Чувство юмора", type: .michaelangelo, image: nil),
            Answer(text: "Холодная голова", type: .raphael, image: nil),
        ], isShuffled: true),
        Question(text: "С кем бы ты поработал ?", type: .singleImages, answers: [
            Answer(text: "Бэтмен", type: .donatello, image: "batman@x1"),
            Answer(text: "Капитан - Америка", type: .leonardo, image: "captain-america@x1"),
            Answer(text: "Человек - Паук", type: .michaelangelo, image: "spiderman@x1"),
            Answer(text: "Дарт - Вейдер", type: .raphael, image: "darth-vader@x1"),
        ], isShuffled: true),
        Question(text: "Как ты предпочитаешь работать ?", type: .range, answers: [
            Answer(text: "В одиночку", type: .raphael, image: nil),
            Answer(text: "Больше предпочитаю одому", type: .donatello, image: nil),
            Answer(text: "Больше предпочитаю в команде", type: .michaelangelo, image: nil),
            Answer(text: "В команде", type: .leonardo, image: nil),
        ], isShuffled: false),
        Question(text: "Какое качество тебе характерно ?", type: .multiply, answers: [
            Answer(text: "Упорство", type: .donatello, image: nil),
            Answer(text: "Ответственность", type: .leonardo, image: nil),
            Answer(text: "Жизнерадостность", type: .michaelangelo, image: nil),
            Answer(text: "Решимость", type: .raphael, image: nil),
        ], isShuffled: true),
        Question(text: "Выбери секретный ингредиент для пиццы 👇", type: .toggleButtons, answers: [
            Answer(text: "🌶", type: .raphael, image: nil),
            Answer(text: "🍍", type: .raphael, image: nil),
            Answer(text: "🧀", type: .leonardo, image: nil),
            Answer(text: "🥦", type: .leonardo, image: nil),
            Answer(text: "🐟", type: .donatello, image: nil),
            Answer(text: "🥓", type: .donatello, image: nil),
            Answer(text: "🍦", type: .michaelangelo, image: nil),
            Answer(text: "🦐", type: .michaelangelo, image: nil),
        ], isShuffled: true),
    ]
}
