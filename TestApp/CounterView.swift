import SwiftUI

struct CounterView: View {
    @State private var count = 0
    @State private var step = 1

    var body: some View {
        NavigationStack {
            VStack(spacing: 28) {
                Text("\(count)")
                    .font(.system(size: 96, weight: .bold, design: .rounded))
                    .contentTransition(.numericText())
                    .animation(.snappy, value: count)

                HStack(spacing: 32) {
                    Button {
                        count -= step
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .font(.system(size: 56))
                            .foregroundStyle(.red)
                    }

                    Button {
                        count += step
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 56))
                            .foregroundStyle(.green)
                    }
                }

                Stepper("步长：\(step)", value: $step, in: 1...10)
                    .frame(maxWidth: 260)

                Button("清零") {
                    count = 0
                }
                .buttonStyle(.bordered)
                .disabled(count == 0)
            }
            .padding()
            .navigationTitle("计数器")
        }
    }
}

#Preview {
    CounterView()
}
