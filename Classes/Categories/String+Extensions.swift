//
//  String+Extensions.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 03.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    
    //MARK:- Properties
    
    public var length: Int {
        return self.characters.count
    }
    
    public var anyText: Bool {
        return !self.isEmpty
    }
    
    // MARK:- Methods
    
    public func md5() -> String {
        var digest = [UInt8](count: Int(CC_MD5_DIGEST_LENGTH), repeatedValue: 0)
        if let data = self.dataUsingEncoding(NSUTF8StringEncoding) {
            CC_MD5(data.bytes, CC_LONG(data.length), &digest)
        }
        
        var digestHex = ""
        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        
        return digestHex
    }
    
    // MARK:- Text dimensions methods
    
    public func textViewHeightWithFont(font: UIFont, maxWidth: Double) -> Double {
        let textView = UITextView()
        textView.font = font
        textView.text = self
        
        
        let size = textView.sizeThatFits(CGSize(width: maxWidth, height: DBL_MAX))
        
        return Double(size.height)
    }
    
    public func labelHeightWithFont(font: UIFont, maxWidth: Double, linebreakMode: NSLineBreakMode) -> Double {
        guard self.anyText else {
            return 0.0
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = linebreakMode
        
        let attributes = [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle]
        let maximumSize = CGSize(width: maxWidth, height: DBL_MAX)
        
        let rect = (self as NSString).boundingRectWithSize(maximumSize,
            options: [.UsesLineFragmentOrigin, .UsesFontLeading],
            attributes: attributes,
            context: nil
        )
        
        return ceil(Double(rect.size.height))
    }
    
}