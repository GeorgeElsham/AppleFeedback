import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Orientation is unknown: \(isUnknown)")
    }

    private var isUnknown: Bool {
        UIDevice.current.orientation == .unknown
    }
}

#Preview {
    ContentView()
}
