//: [Previous](@previous)

import Foundation

//-------------------- 字符串字面量 --------------------
let someString = "Some string literal value"


//-------------------- 多行字符串字面量 --------------------
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,\
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on\
till you come to the end; then stop."
"""

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""


//-------------------- 字符串中的特殊字符 --------------------
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"        // $,  Unicode 编码是 U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode 编码是 U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode 编码是 U+1F496


//-------------------- 初始化一个空字符串 --------------------
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}


//-------------------- 可变字符串 --------------------
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"
// 编译报错 - 一个常量字符串不能被修改


//-------------------- 使用字符 --------------------
for character in "Dog!🐶" {
    print(character)
}

let exclamationMark: Character = "!"

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// 输出 "Cat!🐱"


//-------------------- 字符串和字符的拼接 --------------------
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
// 现在 welcome 的值等同于 "hello there"

var instruction = "look over"
instruction += string2
// 现在 instruction 的值等于 "look over there"

let exclamationMark2: Character = "!"
welcome.append(exclamationMark2)

print("-------------------------------")
let badStart = """
one
two
"""

let end = """
thre
"""
print(badStart + end)
// 打印两行：
// one
// twothree

print("-------------------------------")
let goodStart = """
one
two

"""
print(goodStart + end)


//-------------------- 字符串插值 --------------------
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"


//-------------------- 字符计数 --------------------
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

var word = "cafe"
print("the number of characters in \(word) is \(word.count)")

word += "\u{301}"
print("the number of characters in \(word) is \(word.count)")


//-------------------- 访问和修改字符串 --------------------
let greeting = "Guten Tag!"
greeting[greeting.startIndex]

greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}


//-------------------- 插入和删除 --------------------

// 在一个字符串指定位置插入单个字符，使用 insert(:at:) 方法
var welcome2:String = "hello"
welcome2.insert("!", at: welcome2.endIndex)
// welcome 现在等于 "hello!"

// 要插入另一个字符串的内容时，使用 insert(contentsOf:at:) 方法。
welcome2.insert(contentsOf: " there", at: welcome2.index(before: welcome2.endIndex))
// welcome 现在等于 "hello there!"

welcome2.remove(at: welcome2.index(before: welcome2.endIndex))
// welcome 现在等于 "hello there"

let range = welcome2.index(welcome2.endIndex, offsetBy: -6)..<welcome2.endIndex
welcome2.removeSubrange(range)
// welcome 现在等于 "hello"


//-------------------- 子字符串 --------------------
let greeting2 = "Hello, world!"
let index2 = greeting2.firstIndex(of: ",") ?? greeting2.endIndex
let beginning = greeting2[..<index2]


//-------------------- 字符串和字符相等 --------------------
let quotation2 = "We're a lot alike, you and I."
let sameQuotation2 = "We're a lot alike, you and I."
if quotation2 == sameQuotation2 {
    print("These two strings are considered equal")
}
// 打印 "These two strings are considered equal"


//-------------------- 前缀和后缀比较 --------------------
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenesss in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")


//-------------------- 字符串的表示形式 --------------------
// 字符串的 Unicode 表示形式
let dogString = "Dog!!🐶"

// UTF-8 表示形式
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

