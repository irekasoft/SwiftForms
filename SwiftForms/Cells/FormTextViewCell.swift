//
//  FormTextViewCell.swift
//  SwiftForms
//
//  Created by Joey Padot on 12/6/14.
//  Copyright (c) 2014 Miguel Angel Ortuño. All rights reserved.
//

import UIKit

open class FormTextViewCell : FormBaseCell, UITextViewDelegate {
  
  // MARK: Cell views
  
  @objc public let titleLabel = UILabel()
  @objc public let textField  = UITextView()
  
  // MARK: Properties
  
  fileprivate var customConstraints: [AnyObject]!
  
  // MARK: Class Funcs
  
  open override class func formRowCellHeight() -> CGFloat {
    return 110.0
  }
  
  // MARK: FormBaseCell
  
  open override func configure() {
    super.configure()
    
    selectionStyle = .none
    
    // Title Label
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
    contentView.addSubview(titleLabel)
    
    titleLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 500), for: .horizontal)
    
    titleLabel.addConstraint(NSLayoutConstraint(item: titleLabel,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1,
                                                constant: 20))
    
    contentView.addConstraint(NSLayoutConstraint(item: titleLabel,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .topMargin,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
    
    contentView.addConstraint(NSLayoutConstraint(item: titleLabel,
                                                 attribute: .left,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .leftMargin,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
    
    contentView.addConstraint(NSLayoutConstraint(item: titleLabel,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .rightMargin,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
    
    // Text Field
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    
    contentView.addSubview(textField)
    
    contentView.addConstraint(NSLayoutConstraint(item: textField,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: titleLabel,
                                                 attribute: .bottom,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
    
    contentView.addConstraint(NSLayoutConstraint(item: textField,
                                                 attribute: .left,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .leftMargin,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
    
    contentView.addConstraint(NSLayoutConstraint(item: textField,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .rightMargin,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
    
    contentView.addConstraint(NSLayoutConstraint(item: textField,
                                                 attribute: .bottom,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .bottom,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
    
    textField.delegate = self
    
  }
  
  open override func update() {
    
    titleLabel.text = rowDescriptor?.title
    textField.text = rowDescriptor?.value as? String
    
    textField.isSecureTextEntry = false
    textField.autocorrectionType = .default
    textField.autocapitalizationType = .sentences
    textField.keyboardType = .default
    
  }
  
  open override func constraintsViews() -> [String : UIView] {
    var views = ["titleLabel" : titleLabel, "textField" : textField]
    if self.imageView!.image != nil {
      views["imageView"] = imageView
    }
    return views
  }
  
  
  
  // MARK: UITextViewDelegate
  
  open func textViewDidChange(_ textView: UITextView) {
    
    guard let text = textView.text , text.count > 0 else { rowDescriptor?.value = nil; update(); return }
    rowDescriptor?.value = text as AnyObject
    update()
    
  }
  
}
