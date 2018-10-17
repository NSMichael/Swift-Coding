//: [Previous](@previous)

import Foundation

//-------------------- 数组 --------------------
// 创建一个空数组
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
// 打印 "someInts is of type [Int] with 0 items."

someInts.append(3)
//someInts = []

// 创建一个带有默认值的数组
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles 是一种 [Double] 数组，等价于 [0.0, 0.0, 0.0]

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles 被推断为 [Double]，等价于 [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles 被推断为 [Double]，等价于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]


// 用数组字面量构造数组
var shoppingList:[String] = ["Eggs", "Milk"]
// shoppingList 已经被构造并且拥有两个初始项。

// 访问和修改数组
print("The shopping list contains \(shoppingList.count) items.")
// 输出 "The shopping list contains 2 items."（这个数组有2个项）

// 使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为   0 ：
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

shoppingList.append("Flour")

shoppingList += ["Baking Powder"]

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
print(shoppingList)

var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"
print(shoppingList)

shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)

shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)

let mapleSyrup = shoppingList.remove(at: 0)
print(shoppingList)

let apples = shoppingList.removeLast()
print(shoppingList)


// 数组的遍历
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index+1): \(value)")
}


//-------------------- 集合（Sets） --------------------
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// 打印 "letters is of type Set<Character> with 0 items."

letters.insert("a")
print(letters)

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

// 为了找出一个 Set 中元素的数量，可以使用其只读属性 count ：
print("I have \(favoriteGenres.count) favorite music genres.")
// 打印 "I have 3 favorite music genres."

// 使用布尔属性 isEmpty 作为一个缩写形式去检查 count 属性是否为 0 ：
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// 打印 "I have particular music preferences."

// 你可以通过调用 Set 的 insert(_:) 方法来添加一个新元素：
favoriteGenres.insert("Jazz")
print(favoriteGenres)
// favoriteGenres 现在包含 4 个元素

// 你可以通过调用 Set 的 remove(_:) 方法去删除一个元素
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// 打印 "Rock? I'm over it."
print(favoriteGenres)

// 使用  contains(_:)  方法去检查 Set 中是否包含一个特定的值：
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

// 遍历一个集合
for genre in favoriteGenres {
    print("\(genre)")
}

print("----------------------------")
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}


// 集合操作
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

// 使用 union(_:)  方法根据两个集合的值创建一个新的集合。
oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

// 使用 intersection(_:) 方法根据两个集合中都包含的值创建的一个新的集合。
oddDigits.intersection(evenDigits).sorted()
// []

// 使用 subtracting(_:) 方法根据不在该集合中的值创建一个新的集合。
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]

// 使用 symmetricDifference(_:)  方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]


// 集合成员关系和相等
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

// 使用 isSubset(of:) 方法来判断一个集合中的值是否也被包含在另外一个集合中。
houseAnimals.isSubset(of: farmAnimals)
// true

// 使用 isSuperset(of:) 方法来判断一个集合中包含另一个集合中所有的值。
farmAnimals.isSuperset(of: houseAnimals)
// true

// 使用 isDisjoint(with:) 方法来判断两个集合是否不含有相同的值（是否没有交集）。
farmAnimals.isDisjoint(with: cityAnimals)
// true


//-------------------- 字典 --------------------
// 创建一个空字典
var namesOfIntegers = [Int: String]()
// namesOfIntegers 是一个空的 [Int: String] 字典

namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
// var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
// 打印 "The airports dictionary is not empty."

airports["LHR"] = "London"
print(airports)

airports["LHR"] = "London Heathrow"
print(airports)
// LHR 应的值被改为 "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// 打印 "The old value for DUB was Dublin."

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
// 打印 "The name of the airport is Dublin Airport."

airports["APL"] = "Apple International"
//"Apple Internation" 不是真的 APL 机场，删除它
print(airports)

print("----------------------------")
airports["APL"] = nil
// APL 现在被移除了
print(airports)

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

// 字典遍历
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

print("----------------------------")
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

print("----------------------------")
for airportName in airports.values {
    print("Airport name: \(airportName)")
}

print("----------------------------")
let airportCodes = [String](airports.keys)
// airportCodes 是 ["YYZ", "LHR"]

let airportNames = [String](airports.values)
// airportNames 是 ["Toronto Pearson", "London Heathrow"]
