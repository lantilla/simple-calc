//
//  main.swift
//  SimpleCalc
//
//  Created by Lauren Antilla on 10/5/17.
//  Copyright © 2017 Lauren Antilla. All rights reserved.
//

import Foundation
print("$ calc")
print("Enter an expression separated by returns:")
var var1 = readLine(strippingNewline: true)!
var operation = var1.split(separator: " ")
var validRes = true
var res = 0
if operation.count > 1 {
    let option = operation[operation.count - 1]
    switch option {
        case "count":
            var valid = true
            var loop = true
            var i = 0
            while loop {
                let num = Int.init(operation[i])
                if i == operation.count - 1 {
                    loop = false
                } else if num == nil {
                    valid = false
                    loop = false
                    print("Invalid input")
                    validRes = false
                }
                i += 1
            }
            if valid {
                res = operation.count - 1
            }
        case "fact":
            let factorial = Int.init(operation[0])
            if operation.count > 2 || factorial == nil || factorial! < 0{
               print("Invalid format")
                validRes = false
            } else {
                res = 1
                for i in 1...factorial! {
                    res = res * i
                }
            }
        case "avg":
            var tot:Int = 0;
            var valid = true
            for i in operation {
                let number = Int.init(i)
                if number != nil {
                    tot = tot + number!
                } else if i != "avg" {
                    print("Invalid input")
                    valid = false
                    validRes = false
                }
            }
            if valid {
                res = tot / (operation.count - 1)
            }
        default:
            print("Operation not found")
    }
} else {
    var1 = var1.trimmingCharacters(in: .whitespacesAndNewlines)
    let num1 = Int.init(var1)
    var oper = readLine(strippingNewline: true)!
    oper = oper.trimmingCharacters(in: .whitespacesAndNewlines)
    var var2 = readLine(strippingNewline: true)!
    var2 = var2.trimmingCharacters(in: .whitespacesAndNewlines)
    let num2 = Int.init(var2)
    if num1 != nil && num2 != nil {
        if oper == "+" {
            res = num1! + num2!
        } else if oper == "-" {
            res = num1! - num2!
        } else if oper == "*" {
            res = num1! * num2!
        } else if oper == "/" {
            res = num1! / num2!
        } else if oper == "%" {
            res = num1! % num2!
        } else {
            print("Operator not found")
            validRes = false
        }
    } else {
        print("Invalid equation")
        validRes = false
    }
}
if validRes {
    print("Result: \(res)")
}


