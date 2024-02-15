import SwiftUI
import UIKit

struct ContentView: View {

    var body: some View {
        VStack{
            SuccessIndicatorView {
                MyLogger.logger.debug("SI View")
            }
            ConfirmRow()
            BottomSheetView()
        }
    }
}

#Preview {
    ContentView ()
}
