//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/15/20.
//

#if canImport(MobileCoreService)

import Foundation
import SwiftUI
import MobileCoreServices

/**
 ユーザーにドキュメントを選択するように求めます。
 # Example #
 ```
 DocumentPicker(documentTypes: [String(kUTTypePDF)],
                onPicked: { (pickedURLs) in
                 print(pickedURLs)
 }) {
     print("Cancelled")
 }
 ```
 */
@available(iOS 13.0, *)
public struct DocumentPicker: UIViewControllerRepresentable {
    
    private var allowMultipleSelections = false
    var documentTypes: [String]
    var onPicked: ([URL]) -> Void
    var onCancel: () -> Void
    
    public init(allowMultipleSelections: Bool = false, documentTypes: [String], onPicked: @escaping ([URL]) -> Void, onCancel: @escaping () -> Void) {
        self.documentTypes = documentTypes
        self.onPicked = onPicked
        self.onCancel = onCancel
        self.allowMultipleSelections = allowMultipleSelections
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(onPicked: onPicked, onCancel: onCancel)
    }

    public func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {
        
    }

    public func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let picker = UIDocumentPickerViewController(documentTypes: documentTypes, in: .import)
        picker.delegate = context.coordinator
        picker.allowsMultipleSelection = self.allowMultipleSelections
        return picker
    }

    public class Coordinator: NSObject, UIDocumentPickerDelegate {
        
        private var onPicked: ([URL]) -> Void
        private var onCancel: () -> Void
        
        init(onPicked: @escaping ([URL]) -> Void, onCancel: @escaping () -> Void) {
            self.onPicked = onPicked
            self.onCancel = onCancel
        }
        
        public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            self.onPicked(urls)
        }

        public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            self.onCancel()
        }

    }
}

#endif
