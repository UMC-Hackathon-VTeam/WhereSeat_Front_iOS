//
//  PaddingTextField.swift
//  WhereSeat_iOS
//
//  Created by 정호진 on 2023/07/04.
//

import Foundation
import UIKit
import SnapKit

final class PaddedTextField: UITextField {
    var padding = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
