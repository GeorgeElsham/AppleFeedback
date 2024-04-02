struct ContentView: View {
    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    @FocusState private var focused: Bool
    @State private var value: Double? = 3
    @State private var valueString = Self.doubleToString(3)

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
                valueString = value.map(Self.doubleToString) ?? ""
            }
        }
    }

    private func valueBinding() -> Binding<String> {
        Binding(
            get: {
                valueString
            },
            set: { new in
                if let newValue = Double(new) {
                    value = newValue
                    valueString = Self.doubleToString(newValue)
                } else if new.isEmpty {
                    value = nil
                    valueString = ""
                }
            }
        )
    }

    private static func doubleToString(_ value: Double) -> String {
        let number = NSNumber(value: value)
        return Self.formatter.string(from: number)!
    }
}

#Preview {
    ContentView()
}
