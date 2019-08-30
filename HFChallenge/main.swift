//
//  main.swift
//  HFChallenge
//
//  Created by Elizabeth Peraza  on 8/29/19.
//  Copyright © 2019 Elizabeth Peraza . All rights reserved.
//

import Foundation

/*=========================================First Challenge======================================*/
func findDifference(array: [Int], k: Int) -> Int {
  var tracker = Int()
  var emptyDictionary = [Int: Int]()
  for number in array {
    let x = number + k
    if !emptyDictionary.keys.contains(number) {
      emptyDictionary[number] = x
    }
  }
  for number in array {
    for (_,value) in emptyDictionary {
      if number == value {
        tracker += 1
      }
    }
  }
  return tracker
}

let array = [1,2,-1,3,5,7,8,9,11]
let k = 10
//output: 2
print(findDifference(array: array, k: k))

let secondArrayTest = [-2,0,1,4,3,19,5,-1,7,5]
let y = 4
//output: 5
print(findDifference(array: secondArrayTest, k: y))

//refactored first challenge

/*=========================================Second Challenge======================================*/
func continousCharacterCount(_ input: String) -> String {
  var trackerCharacterCount = String()
  var counter = 0
  let onlyLetter = CharacterSet.letters
  let cleanedString = String(input.unicodeScalars.filter{onlyLetter.contains($0)})
  guard var currentCharacter = cleanedString.first else {
    return "Please enter a valid input, this is an empty string."
  }
  for character in input where character.isLetter {
    if character != currentCharacter {
      trackerCharacterCount.append("\(currentCharacter)\(counter)")
      currentCharacter = character
      counter = 1
    } else {
      counter += 1
    }
  }
  if let char = input.last, currentCharacter == char {
    trackerCharacterCount.append("\(currentCharacter)\(counter)")
  }
  return trackerCharacterCount
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



