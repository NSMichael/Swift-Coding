//: [Previous](@previous)

import Foundation

//-------------------- For-In 循环 --------------------
// 可以使用 for-in 循环来遍历序列中的所有元素
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!

// 你也可以通过遍历一个字典来访问它的键值对。遍历字典时其中的每个元素都会返回成 (key, value) 元组（Tuple）的形式
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
// ants have 6 legs
// cats have 4 legs
// spiders have 8 legs
// Dictionary 内部的内容是无序的，所以遍历的顺序不确保和之后重新获取的顺序一致。

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

print("----------------------------")
// 如果你不需要使用区间中的所有值，你可以使用 - 替代变量名来忽略对应的值。
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
    print("\(answer) * \(base) = \(answer * base)")
}
print("\(base) to power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"

// 想象在手表表面上画每分钟的刻度标记。你想要从 0 分钟开始画 60 个刻度标记。可以使用半开区间操作符（..<）来包含下界但不包含上界。
let minutes = 60
for tickMark in 0..<minutes {
    // 每分钟渲染一个刻度线（60 次）
//    print("current: \(tickMark)")
}

// 一些用户在他们的界面上可能想要更少的刻度标记。他们可能更喜欢每 5 分钟一个刻度。使用 stride(from:to:by:) 函数可以跳过不需要的标记。
let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // 每 5 分钟打一个标记（0, 5, 10, 15 ... 45, 50, 55）
//    print("current: \(tickMark)")
}

//-------------------- While 循环 --------------------
// while 在每次循环开始时判断条件。
// repeat-while 在每次循环结束时判断条件。
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
print(board)

var square = 0
var diceRoll = 0
while square < diceRoll {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1}
    
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
}
print("Game over!")

//-------------------- 条件语句-If --------------------
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}
// 打印 "It's very cold. Consider wearing a scarf."

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// 打印 "It's not that cold. Wear a t-shirt."

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// 打印 "It's really warm. Don't forget to wear sunscreen."

//temperatureInFahrenheit = 72
//if temperatureInFahrenheit <= 32 {
//    print("It's very cold. Consider wearing a scarf.")
//} else if temperatureInFahrenheit >= 86 {
//    print("It's really warm. Don't forget to wear sunscreen.")
//}

//-------------------- 条件语句-Switch --------------------
let someCharacter: Character = "z"
switch someCharacter {
    case "a":
        print("The first letter of the alphabet")
    case "z":
        print("The last letter of the alphabet")
    default:
        print("Some other character")
}

//-------------------- 不存在隐式的贯穿 --------------------
/*
let anotherCharacter: Character = "a"
    switch anotherCharacter {
        case "a": // 无效，分支是空的
        case "A":
            print("The letter A")
        default:
            print("Not the letter A")
}
 */
// 这会报编译错误。

let anotherCharacter: Character = "a"
    switch anotherCharacter {
        case "a", "A":
            print("The letter A")
        default:
            print("Not the letter A")
}
//  打印 "The letter A"

//-------------------- 区间匹配 --------------------
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
//let naturalCount: String
var naturalCount: String = ""
switch approximateCount {
    case 0:
        naturalCount = "no"
    case 1..<5:
        naturalCount = "a few"
    case 5..<12:
        naturalCount = "several"
    case 12..<100:
        naturalCount = "dozens of"
    case 100..<1000:
        naturalCount = "hundreds of"
    default:
        naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."

//-------------------- 元组 --------------------
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// 打印 "(1, 1) is inside the box"


//-------------------- 值绑定 --------------------
let anotherPoint = (2, 0)
switch anotherPoint {
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")
    case (0, let y):
        print("on the y-axis with a y value of \(y)")
    case let(x, y):
        print("somewhere else at (\(x), \(y))")
}


//-------------------- Where --------------------
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// 打印 "(1, -1) is on the line x == -y"y"

//-------------------- 复合分支 --------------------
let someCharacter2: Character = "e"
switch someCharacter2 {
case "a", "e", "i", "o", "u":
    print("\(someCharacter2) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter2) is a consonant")
default:
    print("\(someCharacter2) is not a vowel or a consonant")
}
// 打印 "e is a vowel"

let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// 打印 "On an axis, 9 from the origin"

//-------------------- 控制转移语句-Continue --------------------
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
// 打印 "grtmndsthnklk"

//-------------------- 控制转移语句-Break --------------------
let numberSymbol: Character = "三"  // 中文里数字 3 的符号
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// 打印 “The integer value of 三 is 3.”

//-------------------- 贯穿 --------------------
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// 打印 "The number 5 is a prime number, and also an integer."


//-------------------- 提前退出 --------------------
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}
greet(person: ["name" : "John"])
// 打印 "Hello John!"
// 打印 "I hope the weather is nice near you."

greet(person: ["name": "Jane", "location": "Cupertino"])
// 打印 "Hello Jane!"
// 打印 "I hope the weather is nice in Cupertino."

//-------------------- 检测 API 可用性 --------------------
if #available(iOS 10, macOS 10.12, *) {
    // 在 iOS 使用 iOS 10 的 API, 在 macOS 使用 macOS 10.12 的 API
} else {
    // 使用先前版本的 iOS 和 macOS 的 API
}
