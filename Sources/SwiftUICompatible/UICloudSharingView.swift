//
//  File.swift
//  
//
//  Created by Shunzhe Ma on R 2/10/02.
//

import Foundation
import SwiftUI
import CloudKit

@available(iOS 13.0, *)
public struct UICloudSharingView: UIViewControllerRepresentable {
    
    private var share: CKShare
    private var container: CKContainer
    private var availablePermissions: UICloudSharingController.PermissionOptions
    
    public init(share: CKShare, container: CKContainer = .default(), availablePermissions: UICloudSharingController.PermissionOptions) {
        self.share = share
        self.container = container
        self.availablePermissions = availablePermissions
    }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    public func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<UICloudSharingView>) {
        return
    }
    
    public func makeUIViewController(context: Context) -> UIViewController {
        let shareVC = UICloudSharingController(share: share, container: container)
        shareVC.availablePermissions = availablePermissions
        return shareVC
    }
    
    public class Coordinator: NSObject {
        
    }
    
}
