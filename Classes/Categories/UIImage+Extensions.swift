//
//  UIImage+Extensions.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 03.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

public extension UIImage {
    var isHorizontalOrientation: Bool {
        return self.imageOrientation == .Down || self.imageOrientation == .DownMirrored || self.imageOrientation == .Up || self.imageOrientation == .UpMirrored
    }
}