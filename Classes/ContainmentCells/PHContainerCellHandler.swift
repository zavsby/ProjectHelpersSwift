//
//  PHContainerCellHandler.swift
//  ProjectHelpers-Swift
//
//  Created by Sergey on 09.11.15.
//  Copyright © 2015 Sergey Plotkin. All rights reserved.
//

import Foundation
import UIKit

public class PHContainerCellHandler<TConfigObj:Equatable, TView: UIView, TCell:UIView where TCell:PHContainerCellProtocol> {
    public typealias ContainerCellUpdateBlock = (content: TView, object: TConfigObj?)->()
    
    /**
     *  The view content to display. Can be set and changed at runtime without specifying new contentInsets.
     */
    public var content: TView? {
        willSet {
            if newValue != content {
                if let contentView = content where contentView.isDescendantOfView(cell.cellContentView) {
                    contentView.removeFromSuperview()
                }
                
                clearContentConstraints()
            }
        }
        
        didSet {
            if oldValue != content {
                if let contentView = content {
                    contentView.translatesAutoresizingMaskIntoConstraints = false
                    cell.cellContentView.addSubview(contentView)
                }
                
                cell.setNeedsUpdateConstraints()
                cell.updateConstraintsIfNeeded()
                
                if let bottomSeparatorView = self.bottomSeparatorView {
                    cell.bringSubviewToFront(bottomSeparatorView)
                }
                
                updateContent()
            }
        }
    }
    
    /**
     *  The inset margins used to generate a simple set of layout constraints for displaying the content property.
     */
    public var contentInsets: UIEdgeInsets {
        didSet {
            leftEdgeConstraint?.constant = contentInsets.left
            rightEdgeConstraint?.constant = contentInsets.right
            topEdgeConstraint?.constant = contentInsets.top
            bottomEdgeConstraint?.constant = -contentInsets.bottom
            
            cell.updateConstraintsIfNeeded()
        }
    }
    
    /**
     *  An optional associated object, useful for keeping track of view data relevancy. Assigning a different object will trigger a call to the updateBlock property to update the content.
     */
    public var configurationObject: TConfigObj? {
        didSet {
            if configurationObject != oldValue {
                updateContent()
            }
        }
    }
    
    /**
     *  Called when the configurationObject property object has changed. Passes back the assigned 'content' property for any custom configuration needed and 'configurationObject'.
     */
    public var updateBlock: ContainerCellUpdateBlock?
    
    
    // MARK:- Private properties
    
    private unowned let cell: TCell
    
    private var leftEdgeConstraint: NSLayoutConstraint?
    private var rightEdgeConstraint: NSLayoutConstraint?
    private var topEdgeConstraint: NSLayoutConstraint?
    private var bottomEdgeConstraint: NSLayoutConstraint?
    private var bottomSeparatorView: UIView?
    
    
    // MARK:- Initializers
    
    public init(cell: TCell, contentInsets: UIEdgeInsets = UIEdgeInsetsZero) {
        self.cell = cell
        self.contentInsets = contentInsets
        self.separatorInsets = UIEdgeInsetsZero
    }
    
    
    // MARK:- Content
    
    /**
    *  Calls updateBlock without changing configuration object.
    */
    public func updateContent() {
        if let updateBlock = self.updateBlock, content = self.content {
            updateBlock(content: content, object: configurationObject)
        }
    }
    
    
    // MARK:- Separator
    
    public var separatorInsets: UIEdgeInsets {
        didSet {
            if !UIEdgeInsetsEqualToEdgeInsets(separatorInsets, oldValue) {
                updateSeparatorFrame()
            }
        }
    }
    
    public func showBottomSeparatorWithColor(color: UIColor) {
        if self.bottomSeparatorView != nil {
            return
        }
        
        let bottomSeparatorView = UIView()
        bottomSeparatorView.userInteractionEnabled = false
        bottomSeparatorView.backgroundColor = color
        bottomSeparatorView.autoresizingMask = [.FlexibleWidth, .FlexibleTopMargin]
        
        self.bottomSeparatorView = bottomSeparatorView
        updateSeparatorFrame()
        
        cell.addSubview(bottomSeparatorView)
    }
    
    public func removeBottomSeparator() {
        if let bottomSeparatorView = self.bottomSeparatorView where bottomSeparatorView.isDescendantOfView(cell) {
            bottomSeparatorView.removeFromSuperview()
        }
        
        self.bottomSeparatorView = nil
    }
    
    private func updateSeparatorFrame() {
        let width = cell.bounds.width - separatorInsets.left - separatorInsets.right
        let height = CGFloat(GenericConstants.OneDevicePixel)
        let top = cell.bounds.height - height
        bottomSeparatorView?.frame = CGRect(x: separatorInsets.left, y: top, width: width, height: height)
    }
    
    
    // MARK:- Layout
    
    /**
    *  Generated set of autolayout constraints based on the content and contentInsets properties.
    */
    internal func constraints() -> [NSLayoutConstraint]? {
        if let content = self.content {
            leftEdgeConstraint = NSLayoutConstraint(item: content, attribute: .Leading, relatedBy: .Equal, toItem: cell.cellContentView, attribute: .Leading, multiplier: 1.0, constant: contentInsets.left)
            rightEdgeConstraint = NSLayoutConstraint(item: content, attribute: .Trailing, relatedBy: .Equal, toItem: cell.cellContentView, attribute: .Trailing, multiplier: 1.0, constant: -contentInsets.right)
            topEdgeConstraint = NSLayoutConstraint(item: content, attribute: .Top, relatedBy: .Equal, toItem: cell.cellContentView, attribute: .Top, multiplier: 1.0, constant: contentInsets.top)
            bottomEdgeConstraint = NSLayoutConstraint(item: content, attribute: .Bottom, relatedBy: .Equal, toItem: cell.cellContentView, attribute: .Bottom, multiplier: 1.0, constant: contentInsets.bottom)
            
            return [leftEdgeConstraint!, rightEdgeConstraint!, topEdgeConstraint!, bottomEdgeConstraint!]
        }
        
        return nil
    }
    
    private func clearContentConstraints() {
        leftEdgeConstraint = nil
        rightEdgeConstraint = nil
        topEdgeConstraint = nil
        bottomEdgeConstraint = nil
        
        cell.clearLayout()
    }
}
