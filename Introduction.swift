import Foundation

struct Person {
    let name: String
    let lastname: String
    let age: Int
    let profession: String
    let hobbies: [String]
    
    func summary() {
        print("Имя: \(name)")
        print("Фамилия: \(lastname)")
        print("Возраст: \(age)")
        print("Профессия: \(profession)")
        print("Увлечения: \(hobbies.joined(separator: ", "))")
    }
}

let me = Person(
    name: "Максим",
    lastname: "Лукин",
    age: 21,
    profession: "Business analyst",
    hobbies: ["Ведение своего бизнеса", "Изучение звуковой обработки", "Графический дизайн"]
)

me.summary()
