import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                SuccessIndicatorView {
                    MyLogger.logger.debug("SI View")
                }

                ConfirmRow()

                BottomSheetView()

                NavigationLink  {
                    CardScreen()
                } label: {
                    Text("Open Card")
                }
            }
        }
        .navigationTitle("Main")
    }
}

#Preview {
    ContentView ()
}
