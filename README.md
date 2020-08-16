# SwiftUICompatible

<img width="500" alt="image" src="https://github.com/mszmagic/SwiftUICompatible/blob/master/social_image.png?raw=true">

`SwiftUI` は新しいフレームワークであるので、フィーチャー `UIKit` の幾らかを欠いています。そららフィーチャー `UIKit` を活用する為には、`UIViewControllerRepresentable` を使用しなければなりません。

頻出する `UIViewControllerRepresentable` のコードを蓄積するレポジトリを作成したので、`SwiftUI` プロジェクトに活用してください。

ぜひお気軽に、作成されたコードをこのレポジトリに追加してください。

## 含まれているクラス `UIViewControllerRepresentable`

- [ファイル内容をプレビュー](/Sources/SwiftUICompatible/QuickLook.swift) (`QLPreviewController`)
- [iOS 14 フォトピッカー](/iOS14/PhotoPicker.swift) (`PhotoPickerView`)
- [メールコンポーザー](/Sources/SwiftUICompatible/mailComposer.swift) (`MFMailComposeViewController`)
- [テキストメッセージコンポーザー](/Sources/SwiftUICompatible/textMessageComposer.swift) (`MFMessageComposeViewController`)
- [ウェブ表示](/Sources/SwiftUICompatible/safariViewController.swift) (`SFSafariViewController`)
- [ドキュメントピッカー](/Sources/SwiftUICompatible/documentPicker.swift) (`UIDocumentPickerViewController`)
- [ビデオプレイヤー](/Sources/SwiftUICompatible/videoPlayer.swift) (`AVPlayerViewController`)

## 使用方法

### - コードをブラウズし、自身のプロジェクトにコピーアンドペーストすることができます。

### - Swift Package Manager

または、`Swift Package Manager` を使用して自身のプロジェクトにコードを挿入することができます。iOS 14のみに対応しているため、`Swift Package Manager` には `PhotoPicker` が含まれないことにご注意ください。

1. Xcode内からプロジェクトを開く
2. 上部のシステムバーの"File"をクリック
3. "Swift Packages"をクリック、次いで"Add package dependency…"をクリック
4. 以下のURLをペースト：`https://github.com/mszmagic/SwiftUICompatible.git`
5. Version: Up to Next Major `1.0.1 <`
6. "Next"をクリック
7. "Done"をクリック。

```swift
import SwiftUICompatible

struct ContentView: View {
    
    @State private var showPreview = false
    
    var body: some View {
        Button(action: {
            self.showPreview = true
        }){
            Text("表示")
        }
        .sheet(isPresented: $showPreview, content: {
             SafariView(url: URL(string: "https://github.com/mszmagic/SwiftUICompatible")!)
        })
    }
    
}
```
