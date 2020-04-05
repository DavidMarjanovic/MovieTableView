import UIKit

var sati = 8
var minute = 30
switch sati {
    case 8:
    switch minute {
        case 0...39:
        print("Ucenici su na prvom satu.")
        case 40...49:
        print("Ucenici su na prvom malom odmoru.")
        case 50...59:
        print("Ucenici su na drugom satu.")
        default:
        print("Nepoznat broj minuta.")
    }
    case 9:
    switch minute {
        case 0...29:
        print("Ucenici su na drugom satu.")
        case 30...39:
        print("Ucenici su na drugom malom odmoru.")
        case 40...59:
        print("Ucenici su na trecem satu.")
        default:
        print("Nepoznat broj minuta.")
    }
    case 10:
    switch minute {
        case 0...19:
        print("Ucenici su na trecem satu.")
        case 20...29:
        print("Ucenici su na trecem malom odmoru.")
        case 30...59:
        print("Ucenici su na cetvrtom satu.")
        default:
        print("Nepoznat broj minuta.")
    }
    case 11:
    switch minute {
        case 0...9:
        print("Ucenici su na cetvrtom satu.")
        case 10...59:
        print("Ucenici su na velikom odmoru.")
        default:
        print("Nepoznat broj minuta.")
    }
    case 12:
    switch minute {
        case 0...39:
        print("Ucenici su na petom satu.")
        case 40...49:
        print("Ucenici su na cetvrtom malom odmoru.")
        case 50...59:
        print("Ucenici su na sestom satu.")
        default:
        print("Nepoznat broj minuta.")
    }
    case 13:
    switch minute {
        case 0...29:
        print("Ucenici su na sestom satu.")
        case 30...39:
        print("Ucenici su na petom malom odmoru.")
        case 40...59:
        print("Ucenici su na sedmom satu.")
        default:
        print("Nepoznat broj minuta.")
    }
    case 14:
    switch minute {
        case 0...19:
        print("Ucenici su na sedmom satu.")
        case 20...29:
        print("Ucenici su na sestom malom odmoru.")
        case 30...59:
        print("Ucenici su na osmom satu.")
        default:
        print("Nepoznat broj minuta.")
    }
    case 15:
    switch minute {
        case 0...9:
        print("Ucenici su na osmom satu.")
        case 10...19:
        print("Ucenici su na sedmom malom odmoru.")
        case 20...59:
        print("Ucenici su na devetom satu.")
        default:
        print("Nepoznat broj minuta.")
    }
    default:
    print("Nepoznat broj sati.")
}
