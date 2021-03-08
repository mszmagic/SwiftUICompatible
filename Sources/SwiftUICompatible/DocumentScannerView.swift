//
//  SwiftUIView.swift
//  
//
//  Created by Shunzhe Ma on R 2/10/18.
//

#if os(iOS)

import SwiftUI
import VisionKit

@available(iOS 13.0, *)
public struct DocumentScannerView: UIViewControllerRepresentable {

    private var onScanCompleted: (VNDocumentCameraScan) -> Void
    
    public init(onScanCompleted: @escaping (VNDocumentCameraScan) -> Void) {
        self.onScanCompleted = onScanCompleted
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(onScanCompleted: self.onScanCompleted)
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentScannerView>) -> VNDocumentCameraViewController {
        let scanner = VNDocumentCameraViewController()
        scanner.delegate = context.coordinator
        return scanner
    }

    public func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: UIViewControllerRepresentableContext<DocumentScannerView>) {
        return
    }
    
    public class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        
        private var onScanCompleted: (VNDocumentCameraScan) -> Void
        
        public init(onScanCompleted: @escaping (VNDocumentCameraScan) -> Void) {
            self.onScanCompleted = onScanCompleted
        }
        
        public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            self.onScanCompleted(scan)
            controller.dismiss(animated: true, completion: nil)
        }
        
    }

}

#endif
