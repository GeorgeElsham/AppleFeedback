import SwiftUI

struct ContentView: View {
    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    @FocusState private var focused: Bool
    @State private var value: Double? = 3
    @State private var valueString: String = (3 as Double).description

    var body: some View {
        VStack {
            TextField("Value", text: valueBinding(), prompt: Text(""))
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
                .focused($focused)

            if let value {
                Text("Value = \(value)")
            } else {
                Text("Value doesn't exist")
            }
        }
        .onChange(of: focused) {
            if !focused {
                valueString = value?.description ?? ""
            }
        }
    }

    private func valueBinding() -> Binding<String> {
        Binding(
            get: {
                valueString
            },
            set: { new in
                value = Double(new)
                valueString = new
            }
        )
    }
}

#Preview {
    ContentView()
}
