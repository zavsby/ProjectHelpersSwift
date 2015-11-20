//
//  PHContainerCollectionViewCell.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 11.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

public class PHContainerCollectionViewCell<TConfigObj: Equatable, TView: UIView> : UICollectionViewCell, PHContainerCellProtocol {
    public var contentHandler: PHContainerCellHandler<TConfigObj, TView, PHContainerCollectionViewCell>!
    
    private var didSetupConstraints = false
    
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