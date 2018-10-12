//: [Previous](@previous)

import Foundation

//-------------------- 赋值运算符 --------------------
let b = 10
var a = 5
a = b
// a 现在等于 10

let (x, y) = (1, 2)
// x 等于 1， y 等于 2


//-------------------- 一元减号运算符 --------------------
let three = 3
let minusThree = -three
let plusThree = -minusThree


//-------------------- 一元加号运算符 --------------------
let minusSix = -6
let alsoMinusSix = +minusSix
// alsoMinusSix 等于 -6


//-------------------- 复合赋值运算符 --------------------
var a2 = 1
a2 += 2


//-------------------- 比较运算符 --------------------
let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize your")
}


//-------------------- 三元运算符 --------------------
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)


//-------------------- 空合运算符 --------------------
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName


//-------------------- 区间运算符 --------------------
// 闭合区间运算符
for index in 1...5 {
    print("\(index) * 5 = \(index*5)")
}

// 半开区间运算符
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i+1) is called \(names[i])")
}

// 单侧区间
for name in names[2...] {
    print(name)
}
print("----------------")
for name in names[...2] {
    print(name)
}

print("----------------")
for name in names[..<2] {
    print(name)
}

let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)


//-------------------- 逻辑运算符 --------------------
// 逻辑非运算符
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

// 逻辑与运算符
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// 逻辑或运算符
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}

// 混合逻辑运算
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
