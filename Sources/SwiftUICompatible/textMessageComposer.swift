//
//  File.swift
//
//
//  Created by Shunzhe Ma on 8/15/20.
//

#if canImport(MessageUI)

import Foundation
import SwiftUI
import MessageUI

/**
アプリ内でテキストメッセージコンポーザーを表示するには。
 # Example #
```
 TextMessageComposerView(receipients: ["012-345-6789"], messageBody: "Example") { (result) in
     print(result)
 }
```
*/

@available(iOS 13.0, *)
public struct TextMessageComposerView: UIViewControllerRepresentable {

    var receipients: [String]
    var messageBody: String
    var onMessageComposeFinished: (MessageComposeResult) -> Void
    
    // Set an error message to present to the user if the device cannot send emails (no email accounts are added)
    var errorMessage: String
    
    public init(receipients: [String], messageBody: String, onMessageComposeFinished: @escaping (MessageComposeResult) -> Void, errorMessage: String = "メールを作成できません。") {
        self.receipients = receipients
        self.messageBody = messageBody
        self.onMessageComposeFinished = onMessageComposeFinished
        self.errorMessage = errorMessage
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(onMessageComposeFinished: self.onMessageComposeFinished)
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<TextMessageComposerView>) {
        
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        guard MFMessageComposeViewController.canSendText() else {
            let errorView = ErrorView(errorMessage: self.errorMessage)
            let vc = UIHostingController(rootView: errorView)
            return vc
        }
        let msgCompose = MFMessageComposeViewController()
        msgCompose.messageComposeDelegate = context.coordinator
        msgCompose.recipients = self.receipients
        msgCompose.body = self.messageBody
        return msgCompose
    }

    public class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        
        private var onMessageComposeFinished: (MessageComposeResult) -> Void

        public init(onMessageComposeFinished: @escaping (MessageComposeResult) -> Void) {
            self.onMessageComposeFinished = onMessageComposeFinished
        }
        
        public func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            controller.dismiss(animated: true, completion: nil)
            self.onMessageComposeFinished(result)
        }

    }
}

#endif
