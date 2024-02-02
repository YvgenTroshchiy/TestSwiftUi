import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        SuccessIndicatorView {
            MyLogger.logger.debug("Logger onViewTap")
            print("onViewTap")
        }
    }
}

#Preview {
    ContentView ()
}
