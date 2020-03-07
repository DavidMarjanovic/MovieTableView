import UIKit

var str = "anavolimilovana"

var palindrome = str.reversed()

if str.elementsEqual(palindrome) {
    print("Palindrom.")
} else {
    print("Not palindrom.")
}
