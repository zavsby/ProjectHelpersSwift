//
//  PHContainerCellProtocol.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 09.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

public protocol PHContainerCellProtocol: CellContentViewProtocol {
    func clearLayout()
}

public protocol CellContentViewProtocol {
    var cellContentView: UIView { get }
}