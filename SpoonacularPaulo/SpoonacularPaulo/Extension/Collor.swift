//
//  Collor.swift
//  SpoonacularPaulo
//
//  Created by Paulo H.M. on 03/11/22.
//

import UIKit
import SwiftUI

extension Color {
    
    init(stringStr: String, alpha: CGFloat = 1) {
        let chars = Array(stringStr.dropFirst())
        self.init(red:   .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue:  .init(strtoul(String(chars[4...5]),nil,16))/255
                  )}
}
