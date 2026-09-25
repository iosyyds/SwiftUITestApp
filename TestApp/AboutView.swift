import SwiftUI
import UIKit

struct AboutView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("应用信息") {
                    LabeledContent("名称", value: "TestApp")
                    LabeledContent("版本", value: "1.0.0")
                    LabeledContent("构建号", value: "1")
                    LabeledContent("系统版本", value: UIDevice.current.systemVersion)
                    LabeledContent("设备型号", value: UIDevice.current.model)
                }

                Section("说明") {
                    Text("这是一个用于验证 GitHub Actions 云端打包管道的 SwiftUI 示例应用。它包含待办清单、计数器、关于三个 Tab，帮助确认安装与运行链路是否正常。")
                }
            }
            .navigationTitle("关于")
        }
    }
}

#Preview {
    AboutView()
}
