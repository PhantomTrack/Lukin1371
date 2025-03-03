// Copy-on-Write (CoW) в структуре IOSCollection
// Используется для предотвращения ненужного копирования данных при изменении
struct IOSCollection<T> {
    private var _elements: [T]
    
    // Проверяем, является ли объект единственным владельцем данных
    private var isUniquelyReferenced: Bool {
        mutating get {
            return isKnownUniquelyReferenced(&_storage)
        }
    }
    
    private var _storage: Storage<T>
    
    // Вспомогательный класс для хранения данных
    private class Storage<T> {
        var elements: [T]
        init(elements: [T]) {
            self.elements = elements
        }
    }
    
    // Инициализатор структуры
    init(elements: [T]) {
        self._storage = Storage(elements: elements)
    }
    
    // Геттер и сеттер для элементов
    var elements: [T] {
        get { return _storage.elements }
        set {
            // Если объект не уникален, создаем копию
            if !isUniquelyReferenced {
                _storage = Storage(elements: newValue)
            } else {
                _storage.elements = newValue
            }
        }
    }
}

// Протокол Hotel (Отель)
protocol Hotel {
    var roomCount: Int { get }
    init(roomCount: Int)
}

// Класс HotelAlfa, реализующий протокол Hotel
class HotelAlfa: Hotel {
    var roomCount: Int
    
    required init(roomCount: Int) {
        self.roomCount = roomCount
    }
}

// Протокол GameDice (Игральный кубик)
protocol GameDice {
    var numberDice: Int { get }
}

// Расширение Int для поддержки GameDice
extension Int: GameDice {
    var numberDice: Int { return self }
    
    // Метод для вывода результата броска кубика
    func rollDice() {
        print("Выпало \(self) на кубике")
    }
}

// Протокол с обязательным и необязательным свойствами
@objc protocol ExampleProtocol {
    var requiredProperty: String { get }
    @objc optional var optionalProperty: String? { get }
    func exampleMethod()
}

// Класс, реализующий только обязательное свойство протокола
class ExampleClass: ExampleProtocol {
    var requiredProperty: String = "Обязательное свойство"
    func exampleMethod() {
        print("Метод вызван")
    }
}

// Протокол Coding (Кодирование)
protocol Coding {
    var workTime: Int { get }
    var codeLines: Int { get }
    func writeCode(platform: String, numberOfSpecialist: Int)
}

// Протокол Stoppable (Остановка работы)
protocol Stoppable {
    func stopCoding()
}

// Класс Company (Компания), реализующий оба протокола
class Company: Coding, Stoppable {
    var programmers: Int // Количество программистов
    var specializations: [String] // Специализации
    
    init(programmers: Int, specializations: [String]) {
        self.programmers = programmers
        self.specializations = specializations
    }
    
    var workTime: Int = 8 // Рабочее время
    var codeLines: Int = 1000 // Количество строк кода
    
    // Метод для начала написания кода
    func writeCode(platform: String, numberOfSpecialist: Int) {
        if numberOfSpecialist > programmers {
            print("Ошибка: недостаточно специалистов для разработки на \(platform)")
        } else {
            print("Разработка началась. Пишем код для \(platform)")
        }
    }
    
    // Метод для завершения работы
    func stopCoding() {
        print("Работа закончена. Сдаю в тестирование")
    }
}
