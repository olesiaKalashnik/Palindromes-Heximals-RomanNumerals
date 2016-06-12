import UIKit

//PALINDROME
//Assumption: palindrome contains no spaces and no punctuation

func filterOutPalindromes(input: [String]) -> [String] {
    return input.filter{isPalindrome($0)}
}

//Helper Function
func isPalindrome(word: String) -> Bool {
    if !word.isEmpty {
        let copyWord = word.lowercaseString
        var count = 0
        var start = copyWord.startIndex
        var end = copyWord.endIndex.predecessor()
        let midIndex = copyWord.characters.count/2
        while (count < midIndex) && (copyWord[start] == copyWord[end]) {
            count += 1
            start = start.successor()
            end = end.predecessor()
        }
        return count == word.characters.count/2
    }
    return false
}

// CONVERT DECIMAL TO HEXIMAL
// For positive integers only
func convertToHex(input: Int) -> String {
    var answer = ""
    let res = convertBase10ToHex(input)
    res[res.startIndex] == "0" && input != 0 ? (answer = res.substringFromIndex(res.startIndex.advancedBy(1))) : (answer = res)
    return "0x\(answer)"
}

//Helper Function
func convertBase10ToHex(input: Int) -> String {
    let decimalToHeximalDict = [10: "A", 11: "B", 12 : "C", 13 : "D", 14 : "E", 15 : "F"]
    let quotient = input / 16
    let remainder = input % 16
    //base case
    if input < 10 {
        return "\(input)"
    } else {
        //recursive case
        var answer = ""
        remainder > 9 ? (answer = "\(convertBase10ToHex(quotient))\(decimalToHeximalDict[remainder]!)") : (answer = "\(convertBase10ToHex(quotient))\(remainder)")
        return answer
    }
}


//ROMAN NUMERALS TO ARABIC
//Assumption: input is a valid Roman numeral

func romanToArabic(input: String) -> Int {
    guard let arrayOfInts = convertRomanToArabicInArray(input) else { return 0 }
    return evaluateIntArray(arrayOfInts)
}

//Helper Functions
func convertRomanToArabicInArray(input: String) -> [Int]? {
    let romanToArabicDict = ["I":1, "V":5, "X":10, "L":50, "C": 100, "D":500, "M":1000]
    var intArray = [Int]()
    for char in input.characters {
        guard let int = romanToArabicDict[String(char)] else {return nil}
        intArray.append(int)
    }
    return intArray
}

func evaluateIntArray(arr : [Int]) -> Int {
    var acc = 0
    if !arr.isEmpty {
        var index = arr.count - 1
        acc = arr[index]
        while (index - 1) >= 0 {
            arr[index] <= arr[index - 1] ? (acc += arr[index-1]) : (acc -= arr[index-1])
            index -= 1
        }
    }
    return acc
}
