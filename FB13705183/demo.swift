import SwiftUI

struct ContentView: View {
    @State private var presented = true
    @State private var detent: PresentationDetent = .large

    var body: some View {
        Button("Present") {
            presented = true
        }
        .sheet(isPresented: $presented) {
            Button("Toggle detent") {
                if detent == .large {
                    detent = .medium
                } else {
                    detent = .large
                }
            }
            .presentationDetents([.medium, .large], selection: $detent)
        }
    }
}

#Preview {
    ContentView()
}
