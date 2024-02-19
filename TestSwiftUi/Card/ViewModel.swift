import Combine
import Foundation

class ViewModel: ObservableObject {
    
    @Published var withdrawalAmount = ""
    @Published var cardNumber = ""
    @Published var cardholdersName = ""
    @Published var cardholdersSurname = ""

    var withdrawalAmountError = ""
    var cardNumberError = ""
    var cardholdersNameError = ""
    var cardholdersSurnameError = ""

    private let cardHolderValidator = CardHolderValidator()

    private var bag = Set<AnyCancellable>()

    init() {
        $cardholdersName.dropFirst()
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) // RunLoop.main
            .sink(receiveValue: { [weak self] name in
                self?.cardholdersNameError = self?.validateCardholdersName(name) ?? .empty
                print("$cardholdersName: \(name)")
            })
            .store(in: &bag)
    }

    private func validateCardholdersName(_ text: String) -> String {
        let error =  cardHolderValidator.validate(text)
        print("validateCardholdersName error: \(error)")

        return cardHolderValidator.validate(text)
    }
}

