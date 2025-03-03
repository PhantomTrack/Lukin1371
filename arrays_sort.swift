import Foundation

// 1. Сортировка массива с помощью замыкания
var numbers = [10, 3, 8, 6, 2]

let sortedAscending = numbers.sorted { $0 < $1 }
print("Сортировка по возрастанию:", sortedAscending)

let sortedDescending = numbers.sorted { $0 > $1 }
print("Сортировка по убыванию:", sortedDescending)

// 2. Метод, принимающий имена друзей и сортирующий их по длине
func sortFriendsByLength(_ names: String...) -> [String] {
    let sortedNames = names.sorted { $0.count < $1.count }
    print("Сортированные имена по длине:", sortedNames)
    return sortedNames
}

let friends = sortFriendsByLength("Матвей", "Дмитрий", "Федор", "Александр")

// 3. Создание словаря (ключ - длина имени, значение - имя)
var nameDictionary = [Int: [String]]()
for name in friends {
    nameDictionary[name.count, default: []].append(name)
}

print("Словарь имен по количеству символов:", nameDictionary)

// 4. Функция, принимающая ключ и выводящая ключ + значение
func printDictionaryValue(for key: Int, in dictionary: [Int: [String]]) -> String {
    if let names = dictionary[key] {
        return "Ключ: \(key), Значение: \(names)"
    } else {
        return "Ключ \(key) не найден в словаре"
    }
}

print(printDictionaryValue(for: 7, in: nameDictionary))

// 5. Функция проверки массивов на пустоту
func checkAndFillArrays(strings: inout [String], numbers: inout [Int]) {
    if strings.isEmpty {
        strings.append("DefaultString")
    }
    if numbers.isEmpty {
        numbers.append(0)
    }

    print("Строковый массив:", strings)
    print("Числовой массив:", numbers)
}

var emptyStrings: [String] = []
var emptyNumbers: [Int] = []

checkAndFillArrays(strings: &emptyStrings, numbers: &emptyNumbers)

