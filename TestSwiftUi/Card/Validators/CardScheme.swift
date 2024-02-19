import Foundation

enum CardScheme {
    case americanExpress
    case dinersClub
    case discover
    case jcb
    case mada
    case maestro
    case mastercard
    case visa
    case unknown

    var cvvLength: Set<Int> {
        switch self {
            case .americanExpress: return [4]
            case .dinersClub: return [3]
            case .discover: return [3]
            case .jcb: return [3]
            case .mada: return [3]
            case .maestro: return [0, 3]
            case .mastercard: return [3]
            case .visa: return [3]
            case .unknown: return [0, 3, 4]
        }
    }

    var regex: NSRegularExpression {
        switch self {
            case .americanExpress: return try! NSRegularExpression(pattern: "^3[47]\\d{13}$")
            case .dinersClub: return try! NSRegularExpression(pattern: "^3(0[0-5]|[68]\\d)\\d{11,16}$")
            case .discover: return try! NSRegularExpression(pattern: "^6(?:011|4[4-9]\\d|5\\d{2})\\d{12}$")
            case .jcb: return try! NSRegularExpression(pattern: "^35\\d{14}$")
            case .mada:
                return try! NSRegularExpression(pattern: "^(4(0(0861|1757|6996|7(197|395)|9201)|1(2565|0685|7633|9593)|2(281(7|8|9)|8(331|67(1|2|3)))|3(1361|2328|4107|9954)|4(0(533|647|795)|5564|6(393|404|672))|5(5(036|708)|7865|7997|8456)|6(2220|854(0|1|2|3))|8(301(0|1|2)|4783|609(4|5|6)|931(7|8|9))|93428)|5(0(4300|6968|8160)|13213|2(0058|1076|4(130|514)|9(415|741))|3(0(060|906)|1(095|196)|2013|5(825|989)|6023|7767|9931)|4(3(085|357)|9760)|5(4180|7606|8848)|8(5265|8(8(4(5|6|7|8|9)|5(0|1))|98(2|3))|9(005|206)))|6(0(4906|5141)|36120)|9682(0(1|2|3|4|5|6|7|8|9)|1(0|1)))\\d{10}$")
            case .maestro:
                return try! NSRegularExpression(pattern: "^(?:5[06789]\\d\\d|(?!6011[0234])(?!60117[4789])(?!60118[6789])(?!60119)(?!64[456789])(?!65)6\\d{3})\\d{8,15}$")
            case .mastercard: return try! NSRegularExpression(pattern: "^(5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)\\d{12}$")
            case .visa: return try! NSRegularExpression(pattern: "^4\\d{12}(\\d{3}|\\d{6})?$")
            case .unknown: return try! NSRegularExpression(pattern: "")
        }
    }

    var eagerRegex: NSRegularExpression {
        switch self {
            case .americanExpress: return try! NSRegularExpression(pattern: "^3[47]\\d*$")
            case .dinersClub: return try! NSRegularExpression(pattern: "^3(0|[68])\\d*$")
            case .discover: return try! NSRegularExpression(pattern: "^6(011|4[4-9]|5)\\d*$")
            case .jcb: return try! NSRegularExpression(pattern: "^35\\d*$")
            case .mada:
                return try! NSRegularExpression(pattern: "^(4(0(0861|1757|6996|7(197|395)|9201)|1(2565|0685|7633|9593)|2(281(7|8|9)|8(331|67(1|2|3)))|3(1361|2328|4107|9954)|4(0(533|647|795)|5564|6(393|404|672))|5(5(036|708)|7865|7997|8456)|6(2220|854(0|1|2|3))|8(301(0|1|2)|4783|609(4|5|6)|931(7|8|9))|93428)|5(0(4300|6968|8160)|13213|2(0058|1076|4(130|514)|9(415|741))|3(0(060|906)|1(095|196)|2013|5(825|989)|6023|7767|9931)|4(3(085|357)|9760)|5(4180|7606|8848)|8(5265|8(8(4(5|6|7|8|9)|5(0|1))|98(2|3))|9(005|206)))|6(0(4906|5141)|36120)|9682(0(1|2|3|4|5|6|7|8|9)|1(0|1)))\\d*$")
            case .mastercard: return try! NSRegularExpression(pattern: "^(2[3-7]|22[2-9]|5[1-5])\\d*$")
            case .maestro:
                return try! NSRegularExpression(pattern: "^(5[0|6-8]\\d{0,17}|6\\d{0,18})$")
            case .visa: return try! NSRegularExpression(pattern: "^4\\d*$")
            case .unknown: return try! NSRegularExpression(pattern: "")
        }
    }

    var maxNumberLength: Int {
        switch self {
            case .americanExpress: return 15
            case .dinersClub: return 19
            case .discover: return 16
            case .jcb: return 19
            case .mada: return 16
            case .maestro: return 19
            case .mastercard: return 16
            case .visa: return 19
            case .unknown: return 19
        }
    }

    var numberSeparatorPattern: [Int] {
        switch self {
            case .americanExpress: return [4, 11]
            case .dinersClub: return [4, 9, 14, 19]
            case .discover: return [4, 9, 14]
            case .jcb: return [4, 9, 14, 19]
            case .mada: return [4, 9, 14]
            case .maestro: return [4, 9, 14, 19]
            case .mastercard, .visa, .unknown: return [4, 9, 14, 19]
        }
    }

    var supported: Bool {
        switch self {
            case .americanExpress, .dinersClub, .discover, .jcb, .mada, .maestro, .unknown: return false
            case .mastercard, .visa: return true
        }
    }
}
