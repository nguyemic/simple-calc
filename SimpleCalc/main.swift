//
//  main.swift
//  SimpleCalc
//
//  Created by Michael Nguyen on 4/2/17.
//  Copyright © 2017 Michael Nguyen. All rights reserved.
//

import Foundation

func invalid(input: String) -> UInt{
    var response = UInt(input)
    while response == nil{
        print("invalid entry, try another number")
        response = UInt(readLine(strippingNewline: true)!)
    }
    return UInt(response!)
}

func add(input: [Int] ) -> Int {
    return input.reduce(0, +)
}

func sub(input: [Int] ) -> Int {
    return input[0] - input[1]
}

func mul(input: [Int] ) -> Int {
    return input[0] * input[1]
}

func div(input: [Int] ) -> Int {
    return input[0] / input[1]
}

func mod(input: [Int] ) -> Int {
    return input[0] % input[1]
}

func fact(n: Int) -> Int {
    if n == 0 { return 1 }
    else {
        return n * fact(n: n - 1)
    }
}

var numberQueue: [Int] = []
var go: Bool = true
var result: Int = 0
while true {
    go = true
    numberQueue = []
    print("Enter an expression of Integers separated by returns:")
    var response = readLine(strippingNewline: true) //handles first inputs
    var number = invalid(input: response!)
    numberQueue.append(Int(number))
    while go == true{ // deals with following inputs
        response = readLine(strippingNewline: true)
        if UInt(response!) != nil {
            numberQueue.append(Int(UInt(response!)!))
        }else{ // checks if inputs strings 'functions'
            if response == "+" && numberQueue.count < 2 { // user types in a + function
                var check = invalid(input: readLine(strippingNewline: true)!)
                numberQueue.append(Int(check))
                result = add(input: numberQueue)
            } else if response == "-" && numberQueue.count < 2 {
                var check = invalid(input: readLine(strippingNewline: true)!)
                numberQueue.append(Int(check))
                result = sub(input: numberQueue)
            } else if response == "*" && numberQueue.count < 2 {
                var check = invalid(input: readLine(strippingNewline: true)!)
                numberQueue.append(Int(check))
                result = mul(input: numberQueue)
            } else if response == "/" && numberQueue.count < 2 {
                var check = invalid(input: readLine(strippingNewline: true)!)
                numberQueue.append(Int(check))
                result = div(input: numberQueue)
            } else if response == "%" && numberQueue.count < 2 {
                var check = invalid(input: readLine(strippingNewline: true)!)
                numberQueue.append(Int(check))
                result = mod(input: numberQueue)
            }else if response == "count"  {
                result = numberQueue.count
            }else if response == "avg" {
                print(numberQueue)
                result = (add(input: numberQueue) / numberQueue.count)
            }else if response == "fact" && numberQueue.count < 2 {
                result = fact(n: numberQueue[0])
            }
            go = false;
        }
    }
    print("Result: \(result)")
}
