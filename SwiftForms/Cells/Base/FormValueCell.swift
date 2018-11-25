//
//  FormValueCell.swift
//  SwiftForms
//
//  Created by Miguel Ángel Ortuño Ortuño on 13/11/14.
//  Copyright (c) 2014 Miguel Angel Ortuño. All rights reserved.
//

import UIKit

// For Cell like Seletion
open class FormValueCell: FormBaseCell {
  
  // MARK: Cell views
  
  @objc public  let titleLabel = UILabel()
  @objc public  let valueLabel = UILabel()
  
  // MARK: Properties
  
  fileprivate var customConstraints: [AnyObject]!
  
  // MARK: FormBaseCell
  
  open override func configure() {
    super.configure()
    
    accessoryType = .disclosureIndicator
    
    // Title Label
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    titleLabel.font = UIFont.boldSystemFont(ofSize: 13)
    titleLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 500), for: .horizontal)
    titleLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 1000), for: .horizontal)    

    contentView.addSubview(titleLabel)
    
    contentView.addConstraint(NSLayoutConstraint(item: titleLabel,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .height,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
    
    contentView.addConstraint(NSLayoutConstraint(item: titleLabel,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .topMargin,
                                                 multiplier: 1.0,
                                                 constant: -20.0))

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
    
    // Value Label
    
    valueLabel.translatesAutoresizingMaskIntoConstraints = false
    valueLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    valueLabel.textColor = UIColor.lightGray
    valueLabel.textAlignment = .left
//    valueLabel.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    contentView.addSubview(valueLabel)
    
    valueLabel.addConstraint(NSLayoutConstraint(item: valueLabel,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1,
                                                constant: 20))
    
    contentView.addConstraint(NSLayoutConstraint(item: valueLabel,
                                                 attribute: .top,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .topMargin,
                                                 multiplier: 1.0,
                                                 constant: 23.0))

    contentView.addConstraint(NSLayoutConstraint(item: valueLabel,
                                                 attribute: .left,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .leftMargin,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
    
    contentView.addConstraint(NSLayoutConstraint(item: valueLabel,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: contentView,
                                                 attribute: .rightMargin,
                                                 multiplier: 1.0,
                                                 constant: 0.0))
  

    
  }
  
  open override func constraintsViews() -> [String : UIView] {
    return ["titleLabel" : titleLabel, "valueLabel" : valueLabel]
  }
  
  
}
