import SwiftUI

enum FocusElement: Hashable {
    case amount
    case card
    case name
    case sureName
}

struct CardScreen: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        VStack (spacing: 16) {
            MyTextField(title: "Withdrawal amount",
                        description: "from $1 to $150 at once",
                        hint: "$0",
                        text: $viewModel.withdrawalAmount,
                        error: viewModel.withdrawalAmountError)
            .padding(.top, 16)

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

            Button {
                print("Review & Confirm")
            } label: {
                HStack {
                    Spacer()
                    Text("Review & Confirm")
                        .foregroundStyle(.black)
                        .font(.system(size: 16, weight: .regular))
                        .padding(14)
                    Spacer()
                }
            }
            .buttonStyle(.plain)
            .background(.orange)
            .cornerRadius(8)
            .padding(.top, 16)
            .padding(.horizontal, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle("Card")
    }
}

#Preview {
    CardScreen()
}
