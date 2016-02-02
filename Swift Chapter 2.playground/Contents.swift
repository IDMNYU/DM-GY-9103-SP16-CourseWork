//: Playground - noun: a place where people can play

import UIKit

//types
var str = "Hello, playground"
str = "hello, Swift"
let constStr = str
var nextYear: Int
var bodyTemp: float_t
var hasPet: Bool
var arrayOfInts: [Int]
var dictionaryOfCapitalByCountry: [String:String]

//collection types
dictionaryOfCapitalByCountry = ["beijing":"china","seol":"korea"]
arrayOfInts = [1,2,3,4,5,6,7,8,9,0]
hasPet = true
hasPet = false

//literals and subscripting
var countingUp = ["One","Two"]
var country = dictionaryOfCapitalByCountry["beijing"]
var country2 = dictionaryOfCapitalByCountry["seol"]
var nameByParkingSpace = [13:"Alice",27:"Bob"]


//initializers
let emptyString = String()
let emptyArray = [Int]()
let emptySetOfFloats = Set<Float>()
let defaultNumber = Int()
let defaultBool = Bool()
let number = 42
let meaning = String(number)
let means = String(meaning)
let availableRooms = Set([20,201,2023])
let defaultFloat = Float()
let floatFromLiteral = Float(3.14)
let easyPi = 3.14
let floatFromDouble = Float(easyPi)
let floatingPi:Float = 3.14

//Properties
arrayOfInts.count
emptyArray.isEmpty

//Instance Methods
countingUp.append("Three")

//optionals
var reading1:Float?
var reading2:Float?
var reading3:Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

//let avgReading = (reading1! + reading2! + reading3!) / 3
if let r1 = reading1, r2 = reading2, r3 = reading3 {
    let avgReading = (r1+r2+r3)/3
} else {
    let errorString = "instrument reported a reading that was nil"
}

//Loops and string interpolation
for (i, string) in countingUp.enumerate(){
    let string = countingUp[i]
}

for (space, name) in nameByParkingSpace{
    let string = "space \(space): \(name)"
}


//Enumerations 

enum pieType {
    case Apple
    case Cherry
    case Pecan

}
let favor = pieType.Apple

let name : String
switch favor {
case .Apple: name = "apple"
case .Cherry: name = "cherry"
case .Pecan: name = "pecan"
}




enum P: Int{
    case Apple = 0
    case Cherry
    case Pecan
}

let PRawVaule = P.Pecan.rawValue

if let pietype = P(rawValue: PRawVaule) {
    
}





