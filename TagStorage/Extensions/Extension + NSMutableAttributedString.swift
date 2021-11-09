//
//  Extension + NSMutableAttributedString.swift
//  TagStorage
//
//  Created by Юрий Альт on 03.11.2021.
//

import Foundation
import UIKit

extension NSMutableAttributedString {

    var fontSize: CGFloat { 17 }
    var boldFont: UIFont { UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont: UIFont { UIFont.systemFont(ofSize: fontSize)}
    
    func bold(_ value: String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func underlined(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .underlineStyle : NSUnderlineStyle.single.rawValue
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
}
