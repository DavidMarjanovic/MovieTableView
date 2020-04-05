import UIKit

enum ClientType{
    case legal
    case person
}
enum AccountType{
    case giro
    case fluid
    case devizni
}
let brojBankRac = 0456523123
var tipBankRac: AccountType = .giro
var tipKlijenta: ClientType = .person
var accountBrojStrnit = "\(brojBankRac)"
var count = 0
var num = brojBankRac
var arrayInt = [Int]()
arrayInt.append(num%10)
while count < 9 {
  num = num/10
  arrayInt.insert(num%10, at: 0)
  count+=1
}
var djeljivSaSest = 0
var a = 10000000
for number in 2...9 {
    djeljivSaSest += arrayInt[number]*a
    a/=10
}
var zadnjeTri = 0
var b = 100
for number in 7...9 {
    zadnjeTri += arrayInt[number]*b
    b /= 10
}
if ((arrayInt[0] == 0 && arrayInt[1] == 4) && (tipBankRac == .fluid || tipBankRac == .devizni || tipBankRac == .giro) && (tipKlijenta == .person || tipKlijenta == .legal)) {
 if (djeljivSaSest % 6 == 0) {
    print("Vas racun je trajno blokiran.")
 } else if (tipBankRac == .giro && tipKlijenta == .legal) {
    print("Cestitamo! Banka vam daruje milijun kuna!")
 } else if (tipKlijenta == .person) && (zadnjeTri % 3 == 0) {
     print("Cestitamo! banka vam daje poticaj od milijun eura!")
}
} else {
    if (!(arrayInt[0] == 0 && arrayInt[1] == 4)) {
        print("Nepostojeci broj racuna.")
    }
    else if (!(tipBankRac == .fluid || tipBankRac == .devizni || tipBankRac == .giro)) {
        print("Nepostojeci tip bankovnog racuna.")
    } else {
        print("Nepostojeci tip klijenta.")
    }
}












