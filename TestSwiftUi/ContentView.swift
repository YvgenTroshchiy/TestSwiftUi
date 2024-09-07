import SwiftUI
import UIKit

struct ContentView: View {
    @State private var showToast = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                SuccessIndicatorView {
                    MyLogger.logger.debug("SI View")
                }
                ConfirmRow()
                BottomSheetView()
                NavigationLink  {
                    ScrollView()
                } label: {
                    Text("Open ScrollView")
                }
                Button(action: {}) {
                    Label("Start", systemImage: "play.circle")
                }
                Button {
                    DispatchQueue.main.async {
//                        Toastmessage = MyToasts(title: "Message Here" , type: .success)
//                        mysettings.showMytoast = true // mysettings is an Environment variable
//                        
//                        let closeAfterSecond = 1
//                        DispatchQueue.main.asyncAfter(deadline: .now() + closeAfterSecond) {
//                            mysettings.showMytoast = false
//                        }
                    }
                } label: {
                    Text("Show toast")
                }
            }
        }
        .navigationTitle("Main")
    }
}

#Preview {
    ContentView ()
}
