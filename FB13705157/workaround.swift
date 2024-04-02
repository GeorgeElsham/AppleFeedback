import SwiftUI
import SwiftUIIntrospect

struct ContentView: View {
    @State private var presented = true

    var body: some View {
        Button("Present") {
            presented = true
        }
        .sheet(isPresented: $presented) {
            SheetView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
    }
}

struct SheetView: View {
    @State private var detent: PresentationDetent = .medium

    var body: some View {
        Text("Sheet")
            .presentationBackground(.regularMaterial)
            .presentationDetents([.medium, .large], selection: $detent)
            .introspect(.sheet, on: .iOS(.v17)) { sheet in
                sheet.presentedViewController.view.backgroundColor = .clear
            }
    }
}

#Preview {
    ContentView()
}
