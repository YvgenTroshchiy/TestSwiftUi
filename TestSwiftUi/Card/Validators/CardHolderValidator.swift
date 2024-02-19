class CardHolderValidator {
    func validate(_ input: String) -> String {
        // Check for length
        let MIN_LENGTH = 2
        let MAX_LENGTH = 50

        if !(MIN_LENGTH...MAX_LENGTH ~= input.count) {
            return "R.string.withdrawals_screen_holder_error_worng_length"
        }

        // Check for alphabetic and Latin characters only
        if input.range(of: "[^a-zA-Z]", options: .regularExpression) != nil {
            return "R.string.withdrawals_screen_holder_latin_only"
        }

        // If all checks pass
        return .empty
    }
}
