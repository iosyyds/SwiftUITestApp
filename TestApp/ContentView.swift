import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TodoListView()
                .tabItem {
                    Label("待办", systemImage: "checklist")
                }

            CounterView()
                .tabItem {
                    Label("计数器", systemImage: "plusminus.circle")
                }

            AboutView()
                .tabItem {
                    Label("关于", systemImage: "info.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
