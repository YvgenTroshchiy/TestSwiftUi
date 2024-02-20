import Foundation
import SwiftUI

struct RowContent: View {

    let name : String
    
    var body: some View {
        HStack {
            Text(name).padding(.leading, 16)
            Spacer()
            Image("success")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
                .padding(.trailing, 16)
        }
        .background() // to be able handle click on Spacer
    }
}

#Preview {
    RowContent (name: "Name")
}
