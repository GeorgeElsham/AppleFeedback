import SwiftUI

struct ContentView: View {
    @State private var selection: Int?

    var body: some View {
        VStack {
            Picker("Picker", selection: $selection) {
                ForEach(0 ..< 3) { index in
                    Text("Index \(index)")
                        .tag(index as Int?)
                }
            }
            .pickerStyle(.segmented)

            Button("Remove selection") {
                selection = nil
            }

            if let $selection = selectionBinding() {
                OtherView(selection: $selection)
            }
        }
    }

    private func selectionBinding() -> Binding<Int>? {
        guard selection != nil else {
            return nil
        }
        return Binding(
            get: { selection! },
            set: { selection = $0 }
        )
    }
}

struct OtherView: View {
    @Binding var selection: Int

    var body: some View {
        Text("Selection = \(selection)")
    }
}

#Preview {
    ContentView()
}
