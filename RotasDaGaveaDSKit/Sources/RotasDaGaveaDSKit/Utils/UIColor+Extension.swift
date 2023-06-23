//
//  UIColor+Extension.swift
//  valedagavea
//
//  Created by Andrew Costa on 29/05/23.
//

import Foundation
import UIKit

extension UIColor {
    
    // pin
    static let darkBlue:UIColor = UIColor(r: 0, g: 98, b: 139, a: 1)
    static let lightYellow:UIColor = UIColor(r: 219, g: 150, b: 0, a: 1)
    
    // launch screen color
    static let launchDarkBlue: UIColor = UIColor(r: 0, g: 29, b: 40, a: 1)
    
    // bottom sheet
    //background: rgba(160, 160, 160, 0.92);
    static let cleanGray: UIColor = UIColor(r: 160, g: 160, b: 160, a: 0.92) // background
    // background: rgba(56, 56, 56, 1);
    static let alternativeDarkGray: UIColor = UIColor(r: 56, g: 56, b: 56, a: 1) // subtitile
    // background: rgba(30, 30, 30, 1);
    static let alternativeBlack: UIColor = UIColor(r: 30, g: 30, b: 30, a: 1) // title
    
    
    convenience init(r: CGFloat,g:CGFloat,b:CGFloat,a:CGFloat = 1) {
        self.init(
            red: r / 255.0,
            green: g / 255.0,
            blue: b / 255.0,
            alpha: a
        )
    }
}
