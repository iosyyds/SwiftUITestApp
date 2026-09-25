import SwiftUI

struct TodoItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var isDone: Bool

    init(id: UUID = UUID(), title: String, isDone: Bool = false) {
        self.id = id
        self.title = title
        self.isDone = isDone
    }
}

struct TodoListView: View {
    @State private var items: [TodoItem] = []
    @State private var newTitle = ""

    private var undoneCount: Int {
        items.filter { !$0.isDone }.count
    }

    var body: some View {
        NavigationStack {
            Group {
                if items.isEmpty {
                    ContentUnavailableView(
                        "暂无待办",
                        systemImage: "checklist",
                        description: Text("在下方输入框添加第一条待办吧")
                    )
                } else {
                    List {
                        ForEach($items) { $item in
                            HStack(spacing: 12) {
                                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                                    .font(.title2)
                                    .foregroundStyle(item.isDone ? Color.green : Color.gray)
                                    .onTapGesture {
                                        item.isDone.toggle()
                                    }
                                Text(item.title)
                                    .strikethrough(item.isDone)
                                    .foregroundStyle(item.isDone ? Color.secondary : Color.primary)
                            }
                        }
                        .onDelete { indexSet in
                            items.remove(atOffsets: indexSet)
                        }
                    }
                }
            }
            .navigationTitle("待办清单")
            .toolbar {
                if !items.isEmpty {
                    EditButton()
                }
            }
            .safeAreaInset(edge: .bottom) {
                HStack(spacing: 12) {
                    TextField("添加新待办…", text: $newTitle)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit(addTodo)

                    Button("添加", action: addTodo)
                        .buttonStyle(.borderedProminent)
                        .disabled(newTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding()
                .background(.bar)
            }
        }
    }

    private func addTodo() {
        let trimmed = newTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        withAnimation {
            items.append(TodoItem(title: trimmed))
        }
        newTitle = ""
    }
}

#Preview {
    TodoListView()
}
