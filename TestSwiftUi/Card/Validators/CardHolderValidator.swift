class CardHolderValidator {
    func validate(_ input: String) -> String {
        // Check for length
        let MIN_LENGTH = 2
        let MAX_LENGTH = 50

        if !(MIN_LENGTH...MAX_LENGTH ~= input.count) {
            return "This field must be between 2 and 50 characters."
        }

        // Check for alphabetic and Latin characters only
        if input.range(of: "[^a-zA-Z]", options: .regularExpression) != nil {
            return "The Latin characters only."
        }

        // If all checks pass
        return .empty
    }
}
