import SwiftUI

struct ContentView: View {
    @State private var presented = true
    @State private var detent: PresentationDetent = .large

    var body: some View {
        Button("Present") {
            presented = true
        }
        .sheet(isPresented: $presented) {
            VStack {
                Button("Toggle detent") {
                    if detent == .large {
                        detent = .medium
                    } else {
                        detent = .large
                    }
                }
                .padding(.top, 50)

                Spacer()
            }
            .presentationBackground {
                Color.red
                    .padding(.bottom, -1000)
            }
            .presentationDetents([.medium, .large], selection: $detent)
        }
    }
}

#Preview {
    ContentView()
}
