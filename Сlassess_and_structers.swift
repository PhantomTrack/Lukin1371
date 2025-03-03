// Родительский класс Транспортное средство
class Vehicle {
    var brand: String
    var year: Int
    var maxSpeed: Double

    init(brand: String, year: Int, maxSpeed: Double) {
        self.brand = brand
        self.year = year
        self.maxSpeed = maxSpeed
    }

    func getInfo() -> String {
        return "Марка: \(brand), Год выпуска: \(year), Макс. скорость: \(maxSpeed) км/ч"
    }

    func makeSound() -> String {
        return "Звук транспорта"
    }
}

// Класс Автомобиль (наследуется от Vehicle)
class Car: Vehicle {
    var numberOfDoors: Int

    init(brand: String, year: Int, maxSpeed: Double, numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        super.init(brand: brand, year: year, maxSpeed: maxSpeed)
    }

    override func getInfo() -> String {
        return super.getInfo() + ", Количество дверей: \(numberOfDoors)"
    }

    override func makeSound() -> String {
        return "Бип-бип!"
    }
}

// Класс Мотоцикл (наследуется от Vehicle)
class Motorcycle: Vehicle {
    var hasSidecar: Bool

    init(brand: String, year: Int, maxSpeed: Double, hasSidecar: Bool) {
        self.hasSidecar = hasSidecar
        super.init(brand: brand, year: year, maxSpeed: maxSpeed)
    }

    override func getInfo() -> String {
        return super.getInfo() + ", Коляска: \(hasSidecar ? "Да" : "Нет")"
    }

    override func makeSound() -> String {
        return "Врум-врум!"
    }
}

// Класс Дом
class House {
    var width: Double
    var height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    // Вычисляет площадь дома
    func calculateArea() -> Double {
        return width * height
    }

    // Удаляет дом
    func destroy() {
        print("Дом уничтожен.")
    }
}

// Класс Ученик
class Student {
    let name: String
    let surname: String
    let age: Int
    let grade: Int
    let averageScore: Double

    init(name: String, surname: String, age: Int, grade: Int, averageScore: Double) {
        self.name = name
        self.surname = surname
        self.age = age
        self.grade = grade
        self.averageScore = averageScore
    }

    var fullName: String {
        return "\(surname) \(name)"
    }
}

// Класс Сортировщик учеников
class StudentSorter {
    static func sortByName(_ students: [Student]) -> [Student] {
        return students.sorted { $0.name < $1.name }
    }

    static func sortBySurname(_ students: [Student]) -> [Student] {
        return students.sorted { $0.surname < $1.surname }
    }

    static func sortByAge(_ students: [Student]) -> [Student] {
        return students.sorted { $0.age < $1.age }
    }

    static func sortByGrade(_ students: [Student]) -> [Student] {
        return students.sorted { $0.grade < $1.grade }
    }

    static func sortByAverageScore(_ students: [Student]) -> [Student] {
        return students.sorted { $0.averageScore > $1.averageScore }
    }
}

// Различия между структурами и классами
/* 
Передача данных:
- Структуры — типы-значения (value types): при присваивании создается копия
- Классы — ссылочные типы (reference types): при присваивании создается ссылка на тот же объект

Наследование:
- Структуры не поддерживают наследование
- Классы поддерживают наследование

Инициализаторы:
- Структуры автоматически получают memberwise-инициализатор
- Классы требуют явного определения инициализаторов

Изменение свойств в методах:
- В структурах нужен модификатор mutating для изменения свойств
- В классах модификатор mutating не нужен

Деинициализаторы:
- Структуры не имеют деинициализаторов
- Классы могут иметь deinit для освобождения ресурсов

Проверка идентичности:
- Для классов можно использовать === и !==
- Для структур такой проверки нет
*/

// Пример структуры Ученик
struct StudentStruct {
    var name: String
    var age: Int
    var grades: [Int]

    func calculateAverageGrade() -> Double {
        if grades.isEmpty {
            return 0.0
        }
        let sum = grades.reduce(0, +)
        return Double(sum) / Double(grades.count)
    }

    mutating func addGrade(_ grade: Int) {
        grades.append(grade)
    }
}

// Пример класса Ученик
class StudentClass {
    var name: String
    var age: Int
    var grades: [Int]

    init(name: String, age: Int, grades: [Int]) {
        self.name = name
        self.age = age
        self.grades = grades
    }

    func calculateAverageGrade() -> Double {
        if grades.isEmpty {
            return 0.0
        }
        let sum = grades.reduce(0, +)
        return Double(sum) / Double(grades.count)
    }

    func addGrade(_ grade: Int) {
        grades.append(grade)
    }

    deinit {
        print("Объект класса StudentClass уничтожен")
    }
}

// Программа для покера
import Foundation

enum Suit: String, CaseIterable {
    case hearts = "червы"
    case diamonds = "бубны"
    case clubs = "трефы"
    case spades = "пики"
}

enum Rank: Int, CaseIterable {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, ace
}

struct Card {
    let rank: Rank
    let suit: Suit
}

// Класс Колода
class Deck {
    private var cards: [Card] = Suit.allCases.flatMap { suit in Rank.allCases.map { rank in Card(rank: rank, suit: suit) } }

    // Перемешивает колоду
    func shuffle() {
        cards.shuffle()
    }

    // Выдает 5 карт
    func dealHand() -> [Card] {
        return Array(cards.prefix(5))
    }
}

// Главная функция
func main() {
    let deck = Deck()
    deck.shuffle()
    let hand = deck.dealHand()

    print("Ваши карты:")
    for card in hand {
        print("- \(card.rank.rawValue) \(card.suit.rawValue)")
    }
}

main()
