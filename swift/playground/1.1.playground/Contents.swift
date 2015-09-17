//: Playground - noun: a place where people can play

import UIKit

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double

//let π ＝ 3.14159
let 你好 = "你好世界"
let 🐶 = "dog"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "swift"
// 这会报编译时错误 - languageName 不可改变
//languageName = "swift++"

println(friendlyWelcome)
print("This is a string")
print("The current value of friendlyWelcome is \(friendlyWelcome)")

let minValue = Int.min
let maxValue = Int.max

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// 输出 "The status code is 404"
print("The status message is \(statusMessage)")
// 输出 "The status message is Not Found"

