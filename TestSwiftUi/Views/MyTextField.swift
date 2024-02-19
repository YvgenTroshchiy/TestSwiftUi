import Foundation
import SwiftUI
import UIKit

import Foundation

struct MyTextField: View {
    var title: String = ""
    var description: String = ""
    var hint: String = ""
    @Binding var text: String
    @Binding var error: String

    var normalColor:Color =  .black
    var errorColor:Color = .red
    
    var body: some View {
        let color = error.isEmpty ? normalColor : errorColor

        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 14))
                .foregroundStyle(color)
            TextField(hint, text: $text)
                .padding(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(color, lineWidth: 1)
                )
            if !description.isEmpty && error.isEmpty {
                Text(description)
                    .font(.system(size: 14))
                    .foregroundStyle(color)
            }
            if !error.isEmpty {
                Text(error)
                    .font(.system(size: 14))
                    .foregroundStyle(errorColor)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 0)
        .background(Color.gray)
    }
}

#Preview("Hint Description") {
    MyTextField (title: "Withdrawal amount",
                 description: "from $1 to $150 at once",
                 hint: "$0",
                 text: .constant("") ,
                 error: .constant(.empty)
    )
}

#Preview("Hint No Description") {
    MyTextField (title: "Withdrawal amount",
                 description: .empty,
                 hint: "$0",
                 text: .constant("") ,
                 error: .constant(.empty)
    )
}

#Preview("Error") {
    MyTextField (title: "Withdrawal amount",
                 description: .empty,
                 hint: "$0",
                 text: .constant("$250") ,
                 error: .constant("Error text with description what was wrong")
    )
}
