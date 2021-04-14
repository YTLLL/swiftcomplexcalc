import Cocoa
print("Welcome back to the UW Calculator")

// Your job is to fill out Calculator so all the expressions
// below both compile and return "true"
class Calculator {
    
    var total : Int
    var tuple1 : Int
    var tuple2 : Int
    var newValue : [String : Int]
    
    init() {
        total = 0
        newValue = [String : Int]()
        tuple1 = 0
        tuple2 = 0
    }
    
    //Normal Calculation
    func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    
    func subtract(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    
    func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    
    func divide(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
    
    //Tuple Calculation
    func add(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        tuple1 = lhs.0 + rhs.0
        tuple2 = lhs.1 + rhs.1
        return (tuple1, tuple2)
    }
    
    func subtract(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        tuple1 = lhs.0 - rhs.0
        tuple2 = lhs.1 - rhs.1
        return (tuple1, tuple2)
    }
    
    func multiply(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        tuple1 = lhs.0 * rhs.0
        tuple2 = lhs.1 * rhs.1
        return (tuple1, tuple2)
    }
    
    func divide(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        tuple1 = lhs.0 / rhs.0
        tuple2 = lhs.1 / rhs.1
        return (tuple1, tuple2)
    }
    
    //List Calculation
    func add(_ arg: [Int]) -> Int {
        for i in arg {
            total += i
        }
        return total
    }
    
    func multiply(_ arg: [Int]) -> Int {
        total = 1
        for i in arg {
            total *= i
        }
        return total
    }
    
    func count(_ arg: [Int]) -> Int {
        return arg.count
    }
    
    func avg(_ arg: [Int]) -> Int {
        return arg.reduce(0, +) / arg.count
    }
    
    
    //Closure functions
    func mathOp(lhs : Int, rhs : Int, op : (Int, Int) -> Int) -> Int {
        return op(lhs, rhs)
    }
    
    func mathOp(args: [Int],beg: Int, op : (Int, Int) -> Int) -> Int {
        var sum : Int = beg
        for i in args {
            sum = op(sum, i)
        }
        return sum
    }

    
    //Dictionary Calculation
    func add(lhs: [String : Int], rhs: [String : Int]) -> [String : Int] {
        let x = lhs["x"]! + rhs["x"]!
        let y = lhs["y"]! + rhs["y"]!
        newValue = ["x" : x , "y" : y]
        return newValue
    }
    
    func subtract(lhs: [String : Int], rhs: [String : Int]) -> [String : Int] {
        let x = lhs["x"]! - rhs["x"]!
        let y = lhs["y"]! - rhs["y"]!
        newValue = ["x" : x , "y" : y]
        return newValue
    }
    
    func multiply(lhs: [String : Int], rhs: [String : Int]) -> [String : Int] {
        let x = lhs["x"]! * rhs["x"]!
        let y = lhs["y"]! * rhs["y"]!
        newValue = ["x" : x , "y" : y]
        return newValue
    }
    
    func divide(lhs: [String : Int], rhs: [String : Int]) -> [String : Int] {
        let x = lhs["x"]! / rhs["x"]!
        let y = lhs["y"]! / rhs["y"]!
        newValue = ["x" : x , "y" : y]
        return newValue
    }
    
}

let calc = Calculator()  // Don't change this declaration name; it's used in all the tests below

// ====> Add your own tests here if you wish <====


// ====> Do not modify code in this section <====
calc.add(lhs: 2, rhs: 2) == 4
calc.subtract(lhs: 2, rhs: 2) == 0
calc.multiply(lhs: 2, rhs: 2) == 4
calc.divide(lhs: 2, rhs: 2) == 1

calc.mathOp(lhs: 5, rhs: 5, op: { (lhs: Int, rhs: Int) -> Int in (lhs + rhs) + (lhs * rhs) }) == 35
    // This style is one way of writing an anonymous function
calc.mathOp(lhs: 10, rhs: -5, op: { ($0 + $1) + ($0 - $1) }) == 20
    // This is the second, more terse, style; either works

calc.add([1, 2, 3, 4, 5]) == 15
calc.multiply([1, 2, 3, 4, 5]) == 120
calc.count([1, 2, 3, 4, 5, 6, 7, 8]) == 8
calc.count([]) == 0
calc.avg([2, 2, 2, 2, 2, 2]) == 2
calc.avg([1, 2, 3, 4, 5]) == 3
calc.avg([1]) == 1

calc.mathOp(args: [1, 2, 3], beg: 0, op: { $0 + $1 }) == 6
    // this is (((0 op 1) op 2) op 3)
calc.mathOp(args: [1, 2, 3, 4, 5], beg: 0, op: { $0 + $1 }) == 15
    // this is (((((0 op 1) op 2) op 3) op 4) op 5)
calc.mathOp(args: [1, 1, 1, 1, 1], beg: 1, op: { $0 * $1 }) == 1
    // this is (((((1 op 1) op 1) op 1) op 1) op 1)

let p1 = (5, 5)
let p2 = (12, -27)
let p3 = (-4, 4)
let p4 = (0, 0)
calc.add(lhs: p1, rhs: p2) == (17, -22)
calc.subtract(lhs: p1, rhs: p2) == (-7, 32)
calc.add(lhs: p4, rhs: p4) == (0, 0)
calc.add(lhs: p3, rhs: p4) == (-4, 4)

let pd1 = ["x": 5, "y": 5]
let pd2 = ["x": -4, "y": 4]
calc.add(lhs: pd1, rhs: pd2) == ["x": 1, "y": 9]
calc.subtract(lhs: pd1, rhs: pd2) == ["x": 9, "y": 1]
