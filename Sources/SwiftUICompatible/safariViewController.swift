//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/15/20.
//

import Foundation
import SwiftUI
import SafariServices
import WebKit

/**
 アプリケーション内でブラウザーウィンドウを表示するには。
  # Example #
 ```
 SafariView(url: URL(string: "https://mszmagic.com")!))
 ```
 */

@available(iOS 13.0, *)
public struct SafariView: UIViewControllerRepresentable {

    let url: URL
    
    public init(url: URL) {
        self.url = url
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    public func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }

}

@available(iOS 13.0, *)
public struct WebViewWithHTMLString: UIViewRepresentable {
    
    var htmlString: String
    
    public typealias UIViewType = WKWebView

    public func makeUIView(context: UIViewRepresentableContext<WebViewWithHTMLString>) -> WKWebView {
        let view = WKWebView()
        view.loadHTMLString(htmlString, baseURL: nil)
        return view
    }

    public func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebViewWithHTMLString>) {
    }
    
}
