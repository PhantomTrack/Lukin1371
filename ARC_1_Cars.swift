// Перечисление действий с автомобилем
enum CarAction {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
    case loadCargo(volume: Double)
    case unloadCargo(volume: Double)
}

// Структура легкового автомобиля
struct PassengerCar {
    let brand: String
    let year: Int
    let trunkVolume: Double
    var isEngineRunning: Bool
    var areWindowsOpen: Bool
    var filledTrunkVolume: Double
    
    mutating func performAction(_ action: CarAction) {
        switch action {
        case .startEngine:
            isEngineRunning = true
            print("\(brand): Двигатель запущен")
        case .stopEngine:
            isEngineRunning = false
            print("\(brand): Двигатель заглушен")
        case .openWindows:
            areWindowsOpen = true
            print("\(brand): Окна открыты")
        case .closeWindows:
            areWindowsOpen = false
            print("\(brand): Окна закрыты")
        case .loadCargo(let volume):
            if filledTrunkVolume + volume <= trunkVolume {
                filledTrunkVolume += volume
                print("\(brand): Загружено \(volume) литров. Заполнено \(filledTrunkVolume)/\(trunkVolume)")
            } else {
                print("\(brand): Недостаточно места для загрузки \(volume) литров")
            }
        case .unloadCargo(let volume):
            if filledTrunkVolume >= volume {
                filledTrunkVolume -= volume
                print("\(brand): Выгружено \(volume) литров. Заполнено \(filledTrunkVolume)/\(trunkVolume)")
            } else {
                print("\(brand): В багажнике нет столько груза")
            }
        }
    }
}

// Структура грузовика
struct Truck {
    let brand: String
    let year: Int
    let cargoVolume: Double
    var isEngineRunning: Bool
    var areWindowsOpen: Bool
    var filledCargoVolume: Double
    
    mutating func performAction(_ action: CarAction) {
        switch action {
        case .startEngine:
            isEngineRunning = true
            print("\(brand): Двигатель запущен")
        case .stopEngine:
            isEngineRunning = false
            print("\(brand): Двигатель заглушен")
        case .openWindows:
            areWindowsOpen = true
            print("\(brand): Окна открыты")
        case .closeWindows:
            areWindowsOpen = false
            print("\(brand): Окна закрыты")
        case .loadCargo(let volume):
            if filledCargoVolume + volume <= cargoVolume {
                filledCargoVolume += volume
                print("\(brand): Загружено \(volume) литров. Заполнено \(filledCargoVolume)/\(cargoVolume)")
            } else {
                print("\(brand): Недостаточно места для загрузки \(volume) литров")
            }
        case .unloadCargo(let volume):
            if filledCargoVolume >= volume {
                filledCargoVolume -= volume
                print("\(brand): Выгружено \(volume) литров. Заполнено \(filledCargoVolume)/\(cargoVolume)")
            } else {
                print("\(brand): В кузове нет столько груза")
            }
        }
    }
}

// Создание экземпляров структур
var car1 = PassengerCar(brand: "Toyota", year: 2020, trunkVolume: 500, isEngineRunning: false, areWindowsOpen: false, filledTrunkVolume: 0)
var truck1 = Truck(brand: "Volvo", year: 2018, cargoVolume: 2000, isEngineRunning: false, areWindowsOpen: false, filledCargoVolume: 0)

// Применение действий
car1.performAction(.startEngine)
car1.performAction(.loadCargo(volume: 200))
car1.performAction(.unloadCargo(volume: 100))

truck1.performAction(.startEngine)
truck1.performAction(.loadCargo(volume: 1500))
truck1.performAction(.unloadCargo(volume: 500))

// Создание словаря с машинами
var carDictionary: [AnyHashable: String] = [
    car1: "Легковой автомобиль Toyota",
    truck1: "Грузовик Volvo"
]
