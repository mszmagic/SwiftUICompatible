//
//  File.swift
//
//
//  Created by Shunzhe Ma on 8/15/20.
//

#if os(iOS)

import Foundation
import SwiftUI
import AVKit

/**
 ビデオプレーヤーを表示するには。
  # Example #
 ```
 VideoPlayer(url: URL(string: "https://www.apple.com/105/media/jp/macbook-pro-16/2019/fa0563a0-8534-4e01-a62a-081b87805fea/films/product/macbookpro-16-product-tpl-jp-2019_1280x720h.mp4")!)
 ```
 */

@available(iOS 13.0, *)
public struct VideoPlayer: UIViewControllerRepresentable {

    let url: URL
    
    public init(url: URL) {
        self.url = url
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<VideoPlayer>) -> AVPlayerViewController {
        let playerController = AVPlayerViewController()
        let player = AVPlayer(url: url)
        playerController.player = player
        return playerController
    }

    public func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<VideoPlayer>) {

    }

}

#endif
