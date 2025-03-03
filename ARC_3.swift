import UIKit

// Класс Man (Человек)
class Man {
    var passport: Passport? // Человек может существовать без паспорта
    
    deinit {
        print("Мужчина удален из памяти")
    }
}

// Класс Passport (Паспорт)
class Passport {
    let man: Man // Паспорт создается с владельцем и не может существовать без него
    
    init(man: Man) {
        self.man = man
    }
    
    deinit {
        print("Паспорт удален из памяти")
    }
}

// Создаем мужчину (может существовать без паспорта)
var man: Man? = Man()

// Создаем паспорт и привязываем его к мужчине
var passport: Passport? = Passport(man: man!)
man?.passport = passport

// Удаляем паспорт, но мужчина остается
passport = nil // Объект еще не удален, его удерживает мужчина

// Теперь удаляем мужчину, и паспорт тоже исчезает
man = nil // Теперь удалены оба объекта
