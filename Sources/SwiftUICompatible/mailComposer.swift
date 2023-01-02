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
 ユーザーが電子メールメッセージを作成できるようにします
 # Example #
 ```
 MailComposeView(receipients: ["example@example.com"], mailSubject: "Example", mailBody: "<p>Example</p>", isMailBodyHtml: true) { (result, error) in
     print(result)
     print(error?.localizedDescription ?? "")
 }
 ```
 */
@available(iOS 13.0, *)
public struct MailComposeView: UIViewControllerRepresentable {

    var receipients: [String]
    var mailSubject: String
    var mailBody: String
    var isMailBodyHtml: Bool
    var onMailComposeFinished: (MFMailComposeResult, Error?) -> Void
    
    // Set an error message to present to the user if the device cannot send emails (no email accounts are added)
    var errorMessage: String
    
    public init(receipients: [String], mailSubject: String, mailBody: String, isMailBodyHtml: Bool = true, onMailComposeFinished: @escaping (MFMailComposeResult, Error?) -> Void, errorMessage: String = "メールアカウントが設定されていないため、電子メールを作成できません。") {
        self.receipients = receipients
        self.mailSubject = mailSubject
        self.mailBody = mailBody
        self.isMailBodyHtml = isMailBodyHtml
        self.onMailComposeFinished = onMailComposeFinished
        self.errorMessage = errorMessage
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(onMailComposeFinished: self.onMailComposeFinished)
    }

    public func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<MailComposeView>) {
        
    }

    public func makeUIViewController(context: Context) -> UIViewController {
        guard MFMailComposeViewController.canSendMail() else {
            let errorView = ErrorView(errorMessage: self.errorMessage)
            let vc = UIHostingController(rootView: errorView)
            return vc
        }
        let mailCompose = MFMailComposeViewController()
        mailCompose.mailComposeDelegate = context.coordinator
        mailCompose.setToRecipients(receipients)
        mailCompose.setSubject(mailSubject)
        mailCompose.setMessageBody(mailBody, isHTML: isMailBodyHtml)
        return mailCompose
    }

    public class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        private var onMailComposeFinished: (MFMailComposeResult, Error?) -> Void

        init(onMailComposeFinished: @escaping (MFMailComposeResult, Error?) -> Void) {
            self.onMailComposeFinished = onMailComposeFinished
        }
        
        public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true, completion: nil)
            onMailComposeFinished(result, error)
        }

    }
}

#endif
