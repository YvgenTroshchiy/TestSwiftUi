import SwiftUI
import OSLog

@main
struct TestSwiftUiApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct MyLogger {
    static let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "test app")
}
