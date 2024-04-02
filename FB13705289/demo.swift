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

            if let $selection = Binding($selection) {
                OtherView(selection: $selection)
            }
        }
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
