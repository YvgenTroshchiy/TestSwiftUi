import Foundation
import SwiftUI

struct BottomSheetView: View {

    struct Item : Identifiable{
        let id = UUID()
        var checked = false
        let name: String

        mutating func toogleSelection() {
            checked = !checked
        }
    }

    @State private var sheetShown = false

    var body: some View {
        let items = [
            Item( name: "4r5t3t"),
            Item( name: "AAA"),
            Item( name: "sdfg"),
            Item( name: "CCC"),
            Item( name: "4r5t3t"),
            Item( name: "311"),
            Item( name: "222"),
            Item( name: "sdfg")
        ]

        Button("Display bottom sheet") {
            sheetShown.toggle()
        }
        .sheet(isPresented: $sheetShown) {
            NavigationStack {
                VStack(){
                    Button(action: {
                        sheetShown.toggle()
                    }) {
                        Image(systemName: "xmark.circle").padding(10)
                    }
                    Text("Review order")
                    Text("Mark the products you have received and will keep")
                    List(items) { item in
                        RowContent(name: item.name)
                            .listRowInsets(.init())
                            .onTapGesture {
//                                item.toogleSelection()
                                print("tap: \(item.name)")
                            }
                    }
                    .listStyle(.plain)
                    .listRowBackground(Color.white)
                    .listRowSeparator(.hidden)
                    .containerShape(Rectangle())
                    //                .listRowBackground(Color.white)
                    //                .navigationTitle("Title")

                    .presentationDetents([.medium])
                }
            }
        }
    }
}

#Preview {
    BottomSheetView ()
}
