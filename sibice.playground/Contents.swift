import Foundation
var array = [Int]()
var n = 50
var i = 1
var j = 1
var kolicinaSibica = 0
while i < n {
    while j > 0 {
        array.append(j%10)
        j=j/10
    }
    i+=1
    j = i
}
for number in array {
    switch number {
        case 0:
        kolicinaSibica += 6
        case 1:
        kolicinaSibica += 2
        case 2:
        kolicinaSibica += 5
        case 3:
        kolicinaSibica += 5
        case 4:
        kolicinaSibica += 4
        case 5:
        kolicinaSibica += 5
        case 6:
        kolicinaSibica += 6
        case 7:
        kolicinaSibica += 3
        case 8:
        kolicinaSibica += 7
        case 9:
        kolicinaSibica += 6
        default:
        kolicinaSibica += 0
    }
}
print("Potrebno je \(kolicinaSibica) sibica da se napisu brojevi od 1 do \(n).")
