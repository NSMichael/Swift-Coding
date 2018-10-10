import UIKit

print("Hello World")            // 打印 「Hello, world!」

//-------------------- 简单值 --------------------
var myVariable = 42             // 用 var 声明变量
myVariable = 50
let myConstant = 42             // 用 let 声明常量

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70 // 在变量后声明类型，用冒号分割

let myFloat = 4.0               // 创建一个 Float 类型且值为 4 的常量

// Swift 中变量或常量的值永远不会被隐式的转换成其它类型.如果你需要把一个值的类型转换为其它类型，则需要显式为实例指定类型
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

// 有一种更简单的方式能让值转换为字符串：把值写在括号中，在括号之前再加一个反斜杠（\）
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

// 对于占用多行的字符串请使用三个引号 （"""）。每个引用行开头的缩进都要跟右引号的缩进相匹配。
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""

// 使用方括号（[]）来创建数组和字典，并且使用下标或者键来访问它们的元素。其中最后一个元素后面允许有逗号。
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

// 使用初始化语法来创建一个空数组或者空字典。
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

// 如果类型信息能够被推断出来，则可以用 [] 创建空数组，
// 用 [:] 创建空字典 --- 就像你给一个变量赋值或给函数传递一个参数一样。
shoppingList = []
occupations = [:]



//-------------------- 控制流 --------------------

// 使用 if 和 switch 来创建条件语句，使用 for-in， while， 以及 repeat-while 来创建循环语句。
// 包裹条件或循环变量的括号是可选的。语句体的大括号是必不可缺的。
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

// 在值的类型后面跟随一个（?）则表示这个值是可选的。
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Applesssed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

// 处理可选值的另一种方法是使用 '??' 操作符来提供默认值。如果缺少可选值，则使用默认值。
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"

// 'Switch' 语句支持任何类型的数据以及各种各样的比较操作——不仅仅局限于整数和测试相等。
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// 用 for-in 语句来遍历字典。由于字典是无序的，所以它的遍历也是无序的。
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// 使用 while 来重复执行一段代码，直至条件改变。循环条件可以放在循环结尾，以保证循环至少执行一次。
var n = 2
while n < 100 {
    n *= 2
}
print(n)

// 你可以使用 ..< 来限定索引范围，并在循环中遍历该索引范围。
var total = 0
for i in 0..<4 {
    total += i
}
print(total)

// 使用 ..< 约束的范围不包括上界，使用 ... 约束的范围包括上界。
var total2 = 0
for i in 0...4 {
    total2 += i
}
print(total2)



//-------------------- 函数和闭包 --------------------

// 使用 func 来声明一个函数。使用函数名和参数来调用函数。 使用 -> 来指定函数返回值类型。
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

// 使用 _ 来表示不使用参数标签。
func greet2(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet2("John", on: "Wednesday")


// 使用元祖来生成复合值，例如使用元组来让一个函数返回多个值。该元组的元素可以通过名称或数字来获取。
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.1)

// 函数间可互相嵌套。被嵌套函数可以访问外部函数中声明的变量
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// 函数是一级类型。这意味着函数可以作为其它函数的返回值。
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// 一个函数也可以作为参数传入另一个函数。
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// 你可以通过使用 {} 来创建一个匿名闭包。使用 in 将参数和返回值类型与闭包函数体分离。
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})


//-------------------- 对象和类 --------------------

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    let exampleNumber = 1
    func exampleFunc(anything: Int) -> String {
        return "I don't know \(exampleNumber)"
    }
}

// 通过在类名称后面插入括号来创建类的实例。使用 . 语法的方式来访问实例中的属性和方法。
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

shape.exampleFunc(anything: 5)

// 一个在类实例被创建时进行初始化的构造器。 使用 init 来创建一个。
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A share with \(numberOfSides) sides."
    }
}

// 子类会在其类名后面加上父类的名字，并用冒号分割。
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

// 除了存储简单的属性，属性还可以拥有 getter 和 setter。
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)


//-------------------- 枚举和结构体 --------------------

// 使用 enum 来创建枚举。像类和其它所有命名类型一样，枚举也包含方法。
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
switch success {
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .failure(message):
        print("Failure... \(message)")
}

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


//-------------------- 协议与扩展 --------------------

// 使用 protocol 来声明一个协议。
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// 类、枚举和结构都可以遵循协议。
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)


//-------------------- 错误处理 --------------------

// 你可以使用任何遵循 Error 协议的类型来表示错误。
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// 使用  throw 跑出异常并且用  throws  来标记一个可以抛出异常的函数。
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    // 改变 printer 的名字为 "Never Has Toner"
//    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
