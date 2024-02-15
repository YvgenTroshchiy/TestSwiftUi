import Foundation
import SwiftUI

struct RowContent: View {

    let name : String
    
    var body: some View {
        HStack (spacing: 16) {
            Text(name)
            Spacer()
            Image("success")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
        }
        .background()
    }
}

#Preview {
    RowContent (name: "Name")
}
