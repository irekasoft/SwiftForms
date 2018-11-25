//
//  FormTextFieldCell.swift
//  SwiftForms
//
//  Created by Miguel Ángel Ortuño Ortuño on 20/08/14.
//  Copyright (c) 2014 Miguel Angel Ortuño. All rights reserved.
//

import UIKit

open class FormTextFieldCell: FormBaseCell {
  
  // MARK: Cell views
  
  public  let titleLabel = UILabel()
  @objc public  let textField  = UITextField()
  
  // MARK: Properties
  
  fileprivate var customConstraints: [AnyObject] = []
  
  // MARK: FormBaseCell
  
  open override func configure() {
    super.configure()
    
    selectionStyle = .none
    
    // Title Label
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
    
    
    contentView.addSubview(titleLabel)
    
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
                                                 attribute: .top,
                                                 multiplier: 1.0,
                                                 constant: 10.0))
    
    contentView.addConstraint(NSLayoutConstraint(item: titleLabel,
                                                 attribute: .left,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .leftMargin,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
    
    contentView.addConstraint(NSLayoutConstraint(item: titleLabel,
                                                 attribute: .trailing,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .trailingMargin,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
    
    // TextField
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)

//    textField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//    textField.frame = CGRect(x: 16, y: 16, width: 300, height: 40)
    
    contentView.addSubview(textField)
    
    textField.addConstraint(NSLayoutConstraint(item: textField,
                                               attribute: .height,
                                               relatedBy: .equal,
                                               toItem: nil,
                                               attribute: .notAnAttribute,
                                               multiplier: 1,
                                               constant: 20))
    
    contentView.addConstraint(NSLayoutConstraint(item: textField,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .topMargin,
                                                 multiplier: 1.0,
                                                 constant: 23.0))
    
    contentView.addConstraint(NSLayoutConstraint(item: textField,
                                                 attribute: .left,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .leftMargin,
                                                 multiplier: 1.0,
                                                 constant: 0.0))

    contentView.addConstraint(NSLayoutConstraint(item: textField,
                                                 attribute: .trailing,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .trailingMargin,
                                                 multiplier: 1.0,
                                                 constant: 0.0))

    
    
    textField.addTarget(self, action: #selector(FormTextFieldCell.editingChanged(_:)), for: .editingChanged)
    
    
  }
  
  open override func update() {
    super.update()
    
    if let showsInputToolbar = rowDescriptor?.configuration.cell.showsInputToolbar , showsInputToolbar && textField.inputAccessoryView == nil {
      textField.inputAccessoryView = inputAccesoryView()
    }
    
    titleLabel.text = rowDescriptor?.title
    textField.text = rowDescriptor?.value as? String
    textField.placeholder = rowDescriptor?.configuration.cell.placeholder
    
    textField.isSecureTextEntry = false
    textField.clearButtonMode = .whileEditing
    
    if let type = rowDescriptor?.type {
      switch type {
      case .text:
        textField.autocorrectionType = .default
        textField.autocapitalizationType = .sentences
        textField.keyboardType = .default
      case .number:
        textField.keyboardType = .numberPad
      case .numbersAndPunctuation:
        textField.keyboardType = .numbersAndPunctuation
      case .decimal:
        textField.keyboardType = .decimalPad
      case .name:
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .words
        textField.keyboardType = .default
      case .phone:
        textField.keyboardType = .phonePad
      case .namePhone:
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .words
        textField.keyboardType = .namePhonePad
      case .url:
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .URL
      case .twitter:
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .twitter
      case .email:
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
      case .asciiCapable:
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .asciiCapable
      case .password:
        textField.isSecureTextEntry = true
        textField.clearsOnBeginEditing = false
      default:
        break
      }
    }
  }
  
  open override func constraintsViews() -> [String : UIView] {
    var views = ["titleLabel" : titleLabel, "textField" : textField]
    if self.imageView!.image != nil {
      views["imageView"] = imageView
    }
    return views
  }
  
  
  open override func firstResponderElement() -> UIResponder? {
    return textField
  }
  
  open override class func formRowCanBecomeFirstResponder() -> Bool {
    return true
  }
  
  // MARK: Actions
  
  @objc func editingChanged(_ sender: UITextField) {
    guard let text = sender.text, text.count > 0 else { rowDescriptor?.value = nil; update(); return }
    rowDescriptor?.value = text as AnyObject
  }
}
