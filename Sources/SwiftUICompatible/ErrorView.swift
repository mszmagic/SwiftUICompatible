//
//  File.swift
//  
//
//  Created by Shunzhe Ma on 8/15/20.
//

import Foundation
import SwiftUI

@available(iOS 13.0.0, *)
struct ErrorView: View {
    
    var errorMessage: String
    
    var body: some View {
        Text(errorMessage)
    }
    
}

