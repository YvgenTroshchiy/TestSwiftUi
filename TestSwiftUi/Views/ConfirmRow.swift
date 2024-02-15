import Foundation
import SwiftUI
import UIKit

struct ConfirmRow: View {

    var body: some View {
        HStack (spacing: 16) {
            Spacer()
            Button {
                print("Review & Confirm")
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
        }
    }
}

#Preview {
    ConfirmRow ()
}
