//
//  main.swift
//  HFChallenge
//
//  Created by Elizabeth Peraza  on 8/29/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation

/*=====================================First Challenge Refactored ====================================*/
func findPairsThatMeetDifference(_ array: [Int], difference: Int) -> Int {
  var counter = Int()
  var trackingDictionary = [Int:Int]()
  for currentNumber in array {
    let numberToFind = currentNumber + difference
    trackingDictionary[currentNumber] = numberToFind
  }
  for currentNum in array {
    for value in trackingDictionary.values {
      if value == currentNum {
        counter += 1
      }
    }
  }
  return counter
}

let array = [1,2,-1,3,5,7,8,9,11]
let difference = 10
//output: 2
print(findPairsThatMeetDifference(array, difference: difference))

let secondArray = [-2,1,4,3,19,5,-1,7,5]
let secondDifference = 4
//output: 4
print(findPairsThatMeetDifference(secondArray, difference: secondDifference))

/*=========================================Second Challenge======================================*/
func continousCharacterCount(_ input: String) -> String {
  var characterCountTracker = String()
  var counter = 0
  let onlyLetters = CharacterSet.letters
  let cleanedString = String(input.unicodeScalars.filter{onlyLetters.contains($0)})
  guard var currentCharacter = cleanedString.first else {
    return "Please enter a valid input, this is an empty string."
  }
  for character in cleanedString {
    if character != currentCharacter {
      characterCountTracker.append("\(currentCharacter)\(counter)")
      currentCharacter = character
      counter = 1
    } else {
      counter += 1
    }
  }
  if let char = input.last, currentCharacter == char {
    characterCountTracker.append("\(currentCharacter)\(counter)")
  }
  return characterCountTracker
}

let input = "aabbbaccaad"
//output: "a2b3a1c2a2d1"
print(continousCharacterCount(input))

let input2 = "aaazbbb"
//output: "a3z1b3"
print(continousCharacterCount(input2))

let input3 = "1a234ccc4b"
//output: "a1c3b1"
print(continousCharacterCount(input3))

let input4 = ""
//output: "Please enter a valid input, this is an empty string."
print(continousCharacterCount(input4))
