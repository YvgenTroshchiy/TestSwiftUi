import Foundation
import SwiftUI
import UIKit

struct ConfirmRow: View {

    @State private var showingAlert = false

    var body: some View {
        HStack (spacing: 16) {
            Spacer()
            Button {
                print("Review & Confirm")
                showingAlert = true
            } label: {
                Text("Review & Confirm")
                    .foregroundStyle(.black)
                    .font(.system(size: 12, weight: .bold))

            }
            .padding(.vertical, 9)
            .padding(.horizontal, 16)
            .buttonStyle(.plain)
            .background(.yellow)
            .cornerRadius(10)
            .padding(.horizontal, 16)
            .alert(isPresented: $showingAlert) {
                       Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
                   }
        }
    }
}

#Preview {
    ConfirmRow ()
}
