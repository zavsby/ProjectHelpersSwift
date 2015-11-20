//
//  PHContainerTableViewCell.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 09.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

public class PHContainerTableViewCell<TConfigObj: Equatable, TView: UIView>: UITableViewCell, PHContainerCellProtocol {
    public private(set) var contentHandler: PHContainerCellHandler<TConfigObj, TView, PHContainerTableViewCell>!
    
    private var didSetupConstraints = false
    
    // MARK:- Initialization
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.contentHandler = PHContainerCellHandler<TConfigObj, TView, PHContainerTableViewCell>(cell: self)
        self.clipsToBounds = true
        self.preservesSuperviewLayoutMargins = false
        self.layoutMargins = UIEdgeInsetsZero
    }
    
    // MARK:- PHContainerCellProtocol
    
    public var cellContentView: UIView {
        return self.contentView
    }
    
    public func clearLayout() {
        didSetupConstraints = false
    }

    // MARK:- Layout
    
    override public func updateConstraints() {
        if !didSetupConstraints {
            addConstraints()
            didSetupConstraints = true
        }
        super.updateConstraints()
    }
    
    private func addConstraints() {
        if let constraints = contentHandler.constraints() {
            contentView.addConstraints(constraints)
        }
    }
}
