import SwiftUI

struct ScrollView: View {
    @State  var titlesArray = ["ATitle" , "BTitle" , "CTitle" , "DTitle"
                               , "ETitle" , "FTitle" , "GTitle", "HTitle", "ITitle", "JTitle", "KTitle", "LTitle", "MTitle", "NTitle", "OTitle", "PTitle", "QTitle", "RTitle", "STitle", "TTitle", "UTitle", "VTitle", "WTitle", "XTitle", "YTitle", "ZTitle"]
    @State  var name = ""

    @State private var isKeyboardVisible = false

    var body: some View {
        VStack {
            ForEach(Array(titlesArray.indices), id: \.self) { index in
                TextField("Text Field \(index+1)", text: $name, onEditingChanged: { isFocused in
                    if isFocused {
                        //                                    withAnimation {
                        //                                        proxy.scrollTo(index,anchor : .top)// scroll the selected textfield
                        //                                    }
                    }
                })
                .id(index) // provide the unique id for ScrollViewReader to read which text field should go on top
                .frame(height: 45)
                .padding([.leading,.trailing],20)
                .disableAutocorrection(true)
                .keyboardType(.alphabet)
                .submitLabel(.return)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.yellow, lineWidth: 1)
                )
                .padding([.leading,.trailing],20)
                //                        }
                //                    }
                .padding(.bottom, isKeyboardVisible ? 180 : 0) // to give some extra space for scorll view else last text field will not scroll on top
                //                }
            }
            .padding(.top,20)

//            Spacer()

//            VStack {
//                Spacer()
//                Button {
//                } label: {
//                    Text("continue")
//                        .padding()
//                }
//                Spacer()
//            }
//            .frame(height: 80)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        //if you provide such padding .ignoresSafeArea(.keyboard, edges: .bottom) this line of code willn't work and default scrolling will go on
        //        .padding(.top,50)
        //        .padding()
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
            self.isKeyboardVisible = true
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
            self.isKeyboardVisible = false
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView()
    }
}
