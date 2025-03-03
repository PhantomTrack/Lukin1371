import Foundation

// 1. Два enum с разными RawValue
enum Numbers: Int, CaseIterable {
    case one = 1, two, three, four, five
}

enum Fruits: String, CaseIterable {
    case apple = "яблоко"
    case banana = "банан"
    case orange = "апельсин"
}

// 2. Enum для анкеты сотрудника
enum Gender: String {
    case male = "мужской"
    case female = "женский"
}

enum AgeCategory: String {
    case young = "18-25"
    case middle = "26-35"
    case senior = "36-50"
    case elderly = "50+"
}

enum Experience: Int {
    case junior = 0, middle = 3, senior = 5, expert = 10
}

// 3. Структура анкеты сотрудника
struct EmployeeForm {
    let gender: Gender
    let age: AgeCategory
    let experience: Experience
}

// 4. Enum с цветами радуги
enum RainbowColors: String, CaseIterable {
    case red = "красный"
    case orange = "оранжевый"
    case yellow = "желтый"
    case green = "зеленый"
    case blue = "голубой"
    case indigo = "синий"
    case violet = "фиолетовый"
}

// 5. Enum для фруктов и их цветов
enum FruitColors: String, CaseIterable {
    case grapePurple = "grape purple"
    case lemonYellow = "lemon yellow"
    case peachOrange = "peach orange"
    case strawberryRed = "strawberry red"
}

// 6. Функция вывода фруктов и их цветов
func printFruitColors() {
    for fruit in FruitColors.allCases {
        print(fruit.rawValue)
    }
}

// 7. Enum для школьных оценок
enum Score: String {
    case excellent = "отлично"
    case good = "хорошо"
    case satisfactory = "удовлетворительно"
    case poor = "неудовлетворительно"

    var numericValue: Int {
        switch self {
        case .excellent: return 5
        case .good: return 4
        case .satisfactory: return 3
        case .poor: return 2
        }
    }
}

// 8. Функция выставления оценок
func getScore(_ score: Score) -> Int {
    return score.numericValue
}

// 9. Enum для автомобилей в гараже
enum Car: String, CaseIterable {
    case ford = "Ford Focus"
    case audi = "Audi Q7"
    case lexus = "Lexus NX"
    case volkswagen = "Volkswagen Golf"
}

// 10. Функция проверки гаража
func checkGarage() {
    let carsInGarage: [Car] = [.ford, .audi, .lexus]
    print("В гараже находятся следующие автомобили:")
    for car in carsInGarage {
        print("- \(car.rawValue)")
    }
}

// Тестируем функции
printFruitColors()
print("Оценка 'хорошо' в числовом формате:", getScore(.good))
checkGarage()
