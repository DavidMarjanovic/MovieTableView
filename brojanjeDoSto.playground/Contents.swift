import UIKit

var broj = 0
var igrac = 0
var reverse = false



while broj < 100 {
    broj += 1
    if broj % 7 == 0 {
        reverse.toggle()
    }
    if reverse && broj % 13 == 0 {
        igrac -= 1
        if (igrac < 1) {
            igrac = 10
        }
        igrac -= 1
        if (igrac < 1) {
            igrac = 10
        }
    }
    if (!reverse && broj % 13 == 0) {
        igrac += 1
        if (igrac > 10) {
            igrac = 1
        }
        igrac += 1
        if (igrac > 10) {
            igrac = 1
        }
    }
    if (!reverse && broj % 13 != 0) {
        igrac += 1
        if (igrac > 10) {
            igrac = 1
        }
    }
    
    if (reverse && broj % 13 != 0) {
        igrac -= 1
        if (igrac < 1) {
            igrac = 10
        }
    }
    print(igrac)
    if (broj == 100) {
        print("igrac broj \(igrac) je izgovorio broj 100")
    }
}

