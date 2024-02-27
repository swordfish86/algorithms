import UIKit

// Solution: We are using more memory so we can have more speed

// We can create some variations to reduce the storage like spliting the result list in 3 and insert every element in the section but that will make us iterate through the corresponding section so we can sort it but will slow dow the speed at the end always is one for another

// Thanks chatGPT :)
func quickSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count/2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}

func sortCharacters(input: String) -> String {
    var numbers: [UInt8] = []
    var upperCaseletters: [UInt8] = []
    var lowerCaseletters: [UInt8] = []
    var specialCharacters: [Character] = []
    var result: [UInt8] = []

    var chars = Array(input)
    chars.sort() //O(*n* log *n*) is using quickSort
//    chars = quickSort(chars)
    for (_, element) in chars.enumerated() {
        if let ascii = element.asciiValue {
            if ascii >= 48 && ascii <= 57 {
                if ascii % 2 == 0 {
                    numbers.append(ascii + 100) // We just do it to identify it
                } else {
                    numbers.append(ascii)
                }
            } else if ascii >= 65 && ascii <= 90 {
                upperCaseletters.append(ascii)
            } else if ascii >= 97 && ascii <= 122 {
                lowerCaseletters.append(ascii)
            } else {
                specialCharacters.append(element)
            }
        } else {
            specialCharacters.append(element)
        }
    }
    numbers.sort() //O(*n* log *n*) is using quickSort
    numbers.forEach {
        if $0 > 148 {
            result.append($0 - 100)
        } else {
            result.append($0)
        }
    }
    result = lowerCaseletters + upperCaseletters + result
    return result.map { String(UnicodeScalar($0)) }.joined() + specialCharacters
}

//print(sortCharacters(input: "Hel3lopla4Ygroun7d"))

print(sortCharacters(input: "#$%&()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[]^_abcdefghijklmnopqrstuvwxyz{|}~€‚ƒ„…†‡ˆ‰Š‹ŒŽ•–—˜™š›œžŸ¡¢£¤¥¦§¨©ª«¬®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ"))


