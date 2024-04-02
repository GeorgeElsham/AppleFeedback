import SwiftUI

struct ContentView: View {
    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = false
        return formatter
    }()

    @FocusState private var focused: Bool
    @State private var value: Double? = 3
    @State private var valueString = Self.doubleToString(3)

    var body: some View {
        VStack {
            TextField("Value", text: valueBinding())
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
                if new.isEmpty {
                    value = nil
                    valueString = ""
                } else if let newValue = Double(new) {
                    value = newValue
                    valueString = Self.doubleToString(newValue)

                    // May be needed in the case that it is set more than once
                    if new.hasSuffix(Self.formatter.decimalSeparator) {
                        valueString.append(Self.formatter.decimalSeparator)
                    }
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
