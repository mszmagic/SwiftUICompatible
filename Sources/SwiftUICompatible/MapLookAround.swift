//
//  SwiftUIView.swift
//  
//
//  Created by msz on 2023/01/02.
//

#if canImport(UIKit)

import SwiftUI
import MapKit

@available(iOS 16.0, *)
public struct MapLookAround: UIViewControllerRepresentable {
    
    let scene: MKLookAroundScene
    
    public init(scene: MKLookAroundScene) {
        self.scene = scene
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<MapLookAround>) -> MKLookAroundViewController {
        return MKLookAroundViewController(scene: scene)
    }
    
    public func updateUIViewController(_ uiViewController: MKLookAroundViewController, context: UIViewControllerRepresentableContext<MapLookAround>) {
        
    }
    
}

#endif
