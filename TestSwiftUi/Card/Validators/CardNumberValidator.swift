import Foundation


struct CardNumberValidationRequest {
    var cardNumber: String
    var isEagerValidation: Bool
}

struct ValidationError: Error {
    var message: String
}

struct LuhnChecker {
    // Implement Luhn check functionality
}

class CardNumberValidator {
    let checker: LuhnChecker

    init(checker: LuhnChecker) {
        self.checker = checker
    }

//    func validate(data: CardNumberValidationRequest) -> CardScheme {
//        // Remove all spaces, new lines and tabs
//        let whitespacesRegex = try! NSRegularExpression(pattern: "\\s")
//        let cardNumber = whitespacesRegex.stringByReplacingMatches(in: data.cardNumber, options: [], range: NSRange(location: 0, length: data.cardNumber.count), withTemplate: "")
//        let cardScheme = data.isEagerValidation ? validateEager(cardNumber) : validate(cardNumber)
//
//        return cardScheme
//    }
//
//    func validate(_ cardNumber: String) throws -> CardScheme {
//        let cardScheme = try provideCardScheme(cardNumber: cardNumber, isEager: false)
//
//        guard cardScheme != .unknown else {
//            throw ValidationError(message: "Card scheme not recognized")
//        }
//
//        guard checker.check(cardNumber) else {
//            throw ValidationError(message: "Card number Luhn check error")
//        }
//
//        return cardScheme
//    }
//
//    func validateEager(_ cardNumber: String) throws -> CardScheme {
//        return try provideCardScheme(cardNumber: cardNumber, isEager: true)
//    }
//
//    func provideCardScheme(cardNumber: String, isEager: Bool) throws -> CardScheme {
//        guard cardNumber.allSatisfy({ $0.isNumber }) else {
//            throw ValidationError(message: "Card number should contain only digits")
//        }
//
//        for case let card in CardScheme.allCases where card.supported {
//            let regex = isEager ? card.eagerRegex : card.regex
//            if regex.matches(in: cardNumber, options: [], range: NSRange(location: 0, length: cardNumber.utf16.count)).count > 0 {
//                return card
//            }
//        }
//
//        return .unknown
//    }
}
