import Combine
import Foundation

class ViewModel: ObservableObject {
    
    @Published var text = ""
//    {
//        didSet {
//            print("text: \(text)")
//            // validate
//
////            if text.filter { $0.isNumber }  >= 100 {
//            if text.count  <= 3 {
//                error = "Erroorrrrrr"
//            } else {
//                error = .empty
//            }
//        }
    //    }

    @Published var error = ""

    private var bag = Set<AnyCancellable>()

    init() {
        $text.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) // RunLoop.main
            .sink(receiveValue: { [weak self] text in
                self?.error = self?.validate(text) ?? .empty
                print("text: \(text)")
            })
            .store(in: &bag)
    }

    private func validate(_ text: String) -> String {
//      f text.filter { $0.isNumber }  >= 100 {
        return if text.count  <= 3 {
             "Erroorrrrrr"
        } else {
             .empty
        }
    }
}
