import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        SuccessIndicatorView {
            print("onViewTap")
        }
    }
}

#Preview {
    ContentView ()
}
