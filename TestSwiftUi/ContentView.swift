import SwiftUI
import UIKit

struct ContentView: View {

    @ObservedObject var viewModel = ViewModel()

//    @State var text: String = ""
//    @State var error: String = "from $1 to $150 at once"
//    @State var error: String = ""

    var body: some View {
        VStack(spacing: 16) {
            SuccessIndicatorView {
                MyLogger.logger.debug("SI View")
            }

            ConfirmRow()

            BottomSheetView()

            MyTextField(title: "Withdrawal amount",
                        description: "from $1 to $150 at once",
                        hint: "$0",
                        text: $viewModel.cardholdersName,
                        error: viewModel.cardholdersNameError)

            MyTextField(title: "Withdrawal amount",
                        description: .empty,
                        hint: "$0",
                        text: $viewModel.cardholdersName,
                        error: viewModel.cardholdersNameError)
        }
    }
}

#Preview {
    ContentView ()
}
