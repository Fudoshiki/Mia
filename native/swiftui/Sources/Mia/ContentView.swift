import SwiftUI
import LiveViewNative

struct MyRegistry: RootRegistry {
    static func loadingView(for url: URL, state: LiveSessionState) -> some View {
        ProgressView()
    }
}

struct ContentView: View {
    @StateObject private var coordinator = LiveSessionCoordinator<MyRegistry>(
        .automatic(URL(string: "https://sharevari.com/")!),
        config: LiveSessionConfiguration()
    )

    var body: some View {
        LiveView(session: coordinator)
            .onReceive(coordinator.$state) { state in
                if case .connectionFailed = state {
                    Task {
                        try await Task.sleep(nanoseconds: 5_000_000_000)
                        await coordinator.reconnect()
                    }
                }
            }
    }
}
