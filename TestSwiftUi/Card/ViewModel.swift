import Combine
import Foundation

class ViewModel: ObservableObject {
    
    @Published var withdrawalAmount = ""
    @Published var cardNumber = ""
    @Published var cardholdersName = ""
    @Published var cardholdersSurname = ""

    @Published var withdrawalAmountError = ""
    @Published var cardNumberError = ""
    @Published var cardholdersNameError = ""
    @Published var cardholdersSurnameError = ""

    private var bag = Set<AnyCancellable>()

    private let cardHolderValidator = CardHolderValidator()

    init() {
        $cardholdersName.dropFirst()
            .sink(receiveValue: { [weak self] name in
                self?.cardholdersNameError = self?.cardHolderValidator.validate(name) ?? .empty
            })
            .store(in: &bag)

        $cardholdersSurname.dropFirst()
            .sink(receiveValue: { [weak self] surname in
                self?.cardholdersSurnameError = self?.cardHolderValidator.validate(surname) ?? .empty
            })
            .store(in: &bag)
    }

    private func validateCardholdersName(_ text: String) -> String {
        let error =  cardHolderValidator.validate(text)
        print("validateCardholdersName error: \(error)")

        return cardHolderValidator.validate(text)
    }
}

