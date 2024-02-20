import Foundation
import SwiftUI
import UIKit

struct SuccessIndicatorView: View {
    let onViewTap: () -> Void

    var body: some View {
        HStack(spacing: 16){
            Image("success")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            VStack(alignment: .leading) {
                Text("Cashback was tracked!")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                Text("Check it in your account.")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
            Spacer()
            Button{
                onViewTap()
            } label: {
                Text("View")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.yellow)
            }
        }
        .padding(16)
        .background(Color .black)
    }
}

#Preview {
    SuccessIndicatorView {
        print("on preview tap")
    }
}
