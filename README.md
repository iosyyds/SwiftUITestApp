# TestApp

一个用于验证「GitHub Actions 云端打包 iOS IPA」管道的 SwiftUI 示例应用。

包含三个 Tab：

- **待办清单**：添加 / 勾选完成 / 删除待办
- **计数器**：步长可调的加减计数器
- **关于**：应用与设备信息

## 如何触发打包

推送到 `main` 分支，或手动运行 Actions 中的 **Build Unsigned IPA** 工作流。

打包产物为**未签名 IPA**，将自动：

1. 上传为 Actions Artifact（`TestApp-ipa`）
2. 创建 GitHub Release 并附带 `TestApp.ipa` 资产

安装前请使用你自己的 Apple 开发者证书重新签名。

## 本地构建

```bash
brew install xcodegen
xcodegen generate
xcodebuild -project TestApp.xcodeproj -scheme TestApp -configuration Release -sdk iphoneos CODE_SIGNING_ALLOWED=NO build
```
