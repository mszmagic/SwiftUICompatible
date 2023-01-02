//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/15/20.
//

#if canImport(UIKit)

import Foundation
import UIKit
import SwiftUI
import QuickLook

@available(iOS 13.0, *)
public struct QuickLookView: UIViewControllerRepresentable {

    var urls: [URL]
    var onDismiss: () -> Void
    
    public init(urls: [URL], onDismiss: @escaping () -> Void) {
        self.urls = urls
        self.onDismiss = onDismiss
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func updateUIViewController(_ uiViewController: UINavigationController, context: UIViewControllerRepresentableContext<QuickLookView>) {
        if let controller = uiViewController.viewControllers.first as? QLPreviewController {
            controller.reloadData()
        }
    }

    public func makeUIViewController(context: Context) -> UINavigationController {
        let controller = QLPreviewController()

        controller.dataSource = context.coordinator
        controller.reloadData()
        
        let navController = UINavigationController(rootViewController: controller)
        
        return navController
    }

    public class Coordinator: NSObject, QLPreviewControllerDataSource {
        var parent: QuickLookView

        init(_ qlPreviewController: QuickLookView) {
            self.parent = qlPreviewController
            super.init()
        }
        public func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return self.parent.urls.count
        }
        public func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            return self.parent.urls[index] as QLPreviewItem
        }

    }
}

#endif
