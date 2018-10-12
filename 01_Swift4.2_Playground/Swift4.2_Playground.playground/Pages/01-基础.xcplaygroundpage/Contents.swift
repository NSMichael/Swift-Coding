//: [Previous](@previous)

import Foundation

//-------------------- 常量和变量 --------------------

// 常量 的值一旦被设定就不能更改，而 变量 可以在将来设置为不同的值。
// 使用 let 关键字声明常量，使用 var 关键字声明变量。
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0


//-------------------- 类型注解 --------------------
var welcomeMessage: String = "123"
welcomeMessage = "Hello"

//var red, green, blue: Double = 0.0


//-------------------- 命名常量和变量命名常量和变量 --------------------
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
//languageName = "Swift++"
// 编译错误: languageName 不可修改.


//-------------------- 打印常量与变量 --------------------
print(friendlyWelcome)

print("The current value of friendlyWelcome is \(friendlyWelcome)")


//-------------------- 注释 --------------------

// 这是一个注释.

/*
 这也是一个注释
 但是是多行的
 */

/* 这是第一个多行注释的开始
 /* 这是第二个，嵌套的多行注释 */
 这是第一个多行注释的结束 */


//-------------------- 分号 --------------------
let cat = "🐱"; print(cat)


//-------------------- 整数 --------------------
let minValue = UInt8.min
let maxValue = UInt8.max


//-------------------- 类型安全与类型推断 --------------------

let meaningOfLife = 42

let pi = 3.14159

let anotherPi = 3 + 0.14159


//-------------------- 整型与浮点型的类型转换 --------------------

// 整型与浮点型数字之间的类型转换必须是显式的
let three = 3
let pointOneFourOneFiveNide = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNide

// 浮点数转整型同样也需要显式转换。一个整型可以以 Double 或 Float 类型初始化
let integerPi = Int(pi2)


//-------------------- 类型别名 --------------------
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min


//-------------------- 布尔值 --------------------
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}

let i = 1
if i == 1 {
    print("Yeah")
}


//-------------------- 元组 --------------------

// http404Error 的类型是 (Int, String), 等于 (404, "Not Found")
let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")


//-------------------- 可选类型 --------------------

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)


//-------------------- 空值 --------------------

var serverResponseCode: Int? = 404
serverResponseCode = nil


//-------------------- if 语句和强制解析 --------------------

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}


//-------------------- 可选绑定 --------------------
if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}


//-------------------- 隐式展开可选项 --------------------

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString

if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}


//-------------------- 错误处理 --------------------

func canThrowAnError() throws {
    // 这个函数可能会出错也可能不会出错
}

do {
    try canThrowAnError()
    // 无错误抛出
} catch {
    // 有错误抛出
}


//-------------------- 调试断言 --------------------

let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
// 因为 -3 小于 0，所以这个断言失败了

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}
