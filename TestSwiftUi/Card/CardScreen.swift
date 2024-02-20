import SwiftUI

struct CardScreen: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        VStack (spacing: 16) {
            MyTextField(title: "Withdrawal amount",
                        description: "from $1 to $150 at once",
                        hint: "$0",
                        text: $viewModel.withdrawalAmount,
                        error: viewModel.withdrawalAmountError)

            MyTextField(title: "Withdrawal amount",
                        description: .empty,
                        hint: "$0",
                        text: $viewModel.cardNumber,
                        error: viewModel.cardNumberError)

            MyTextField(title: "Withdrawal amount",
                        description: .empty,
                        hint: "$0",
                        text: $viewModel.cardholdersName,
                        error: viewModel.cardholdersNameError)

            MyTextField(title: "Withdrawal amount",
                        description: .empty,
                        hint: "$0",
                        text: $viewModel.cardholdersSurname,
                        error: viewModel.cardholdersSurnameError)
        }
        .navigationTitle("Card")
    }
}

#Preview {
    CardScreen()
}
