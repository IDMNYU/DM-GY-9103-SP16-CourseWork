//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
str = "Hello, Swift"
let constStr = str

let number = 42
let fmStation: Float = 91.1

var countingUp = ["one","two"]
let secondElement = countingUp[1]
countingUp.count

countingUp.append("three")

let nameByParkingSpace = [13: "Alice", 27: "Bob"]
if let space13Assignee: String? = nameByParkingSpace[13]
{
    print("Key 13 is assigned in the dictionary!")
}

for (space,name) in nameByParkingSpace
{
    let permit = "Space \(space): \(name)"
}

let space42Assignee: String? = nameByParkingSpace[42]


let emptyString = ""
emptyString.isEmpty
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()

let meaningOfLife = String(number)

let availableRooms = Set([205,411,412])

let defaultFloat = Float()
let floatFromLiteral = Float(3.14)

let easyPi = 3.14
let floatFromDouble = Float(easyPi)
let floatingPi: Float = 3.14

var nextYear: Int
var bodyTemp: Float
var hasPet: Bool

var arrayofInts: Array<Int>
var arrayofInts2: [Int]

var dictionaryofCapitalsByCountry: Dictionary<String,String>.Element
var dictionaryofCompaniesByLocation: [String:String]

var winningLotteryNumber: Set<Int>


var anOptionalFloat: Float?
var anOptionalArrayOfStrings: [String]?
var anOptionalArrayOfOptionalStrings: [String?]

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
//reading3 = 9.7

if let r1 = reading1, r2 = reading2, r3 = reading3
{
    let avgReading = (r1+r2+r3)/3
}
else
{
    let errorString = "Instrument reported a reading as nil."
}
//let avgReading = (reading1! + reading2! + reading3!) / 3


enum PieType: Int
{
    case Apple = 0
    case Cherry
    case Pecan
}

let favoritePie = PieType.Apple

let name: String
switch favoritePie
{
case.Apple:
    name = "Apple"
case.Cherry:
    name="Cherry"
case.Pecan:
    name = "Pecan"
}

let pieRawValue = PieType.Pecan.rawValue
if let pieType = PieType(rawValue: pieRawValue)
{
    print("Got a valid pieType")
}
