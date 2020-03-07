import UIKit

var str = "racecar"

var palindrome = str.reversed()

if str.elementsEqual(palindrome) {
    print("Palindrom.")
} else {
    print("Not palindrom.")
}
