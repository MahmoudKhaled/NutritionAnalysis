//  UITextViewExtension.swift

import UIKit

//MARK:- Inspectable borders and width
public extension UITextView {
    
    @IBInspectable var borderColor: UIColor? {
        set(newValue) {
            self.layer.borderColor = newValue?.cgColor
        } get {
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.gray.cgColor)
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set(newValue) {
            self.layer.borderWidth = newValue
        } get {
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set(newValue) {
            self.layer.cornerRadius = newValue
        } get {
            return self.layer.cornerRadius
        }
    }
    
}
