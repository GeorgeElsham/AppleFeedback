import SwiftUI

struct ContentView: View {
    private static let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = false
        return formatter
    }()

    @State private var value: Double? = 3

    var body: some View {
        VStack {
            TextField("Value", value: $value, formatter: Self.formatter)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)

            if let value {
                Text("Value = \(value)")
            } else {
                Text("Value doesn't exist")
            }
        }
    }
}

#Preview {
    ContentView()
}
