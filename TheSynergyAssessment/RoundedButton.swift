//
//  RoundedButton.swift
//  TheSynergyAssessment
//
//  Created by Sain-R Edwards on 10/20/18.
//  Copyright © 2018 Swift Koding 4 Everyone. All rights reserved.
//

import UIKit
import ObjectiveC

var defaultColorHandle: UInt8 = 0
var disabledColorHandle: UInt8 = 0
var selectedColorHandle: UInt8 = 0

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}

extension RoundedButton {
    
    private func image(withColor color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 32.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
 
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(image(withColor: color), for: state)
    }
    
    @IBInspectable var defaultColor: UIColor? {
        get {
            if let color = objc_getAssociatedObject(self, &defaultColorHandle) as? UIColor {
                return color
            }
            return nil
        }
        set {
            if let color = newValue {
                self.setBackgroundColor(color, for: .selected)
                objc_setAssociatedObject(self, &defaultColorHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            } else {
                self.setBackgroundImage(nil, for: .selected)
                objc_setAssociatedObject(self, &defaultColorHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    @IBInspectable var selectedColor: UIColor? {
        get {
            if let color = objc_getAssociatedObject(self, &selectedColorHandle) as? UIColor {
                return color
            }
            return nil
        }
        set {
            if let color = newValue {
                self.setBackgroundColor(color, for: .selected)
                objc_setAssociatedObject(self, &selectedColorHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            } else {
                self.setBackgroundImage(nil, for: .selected)
                objc_setAssociatedObject(self, &selectedColorHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    @IBInspectable var disabledColor: UIColor? {
        get {
            if let color = objc_getAssociatedObject(self, &disabledColorHandle) as? UIColor {
                return color
            }
            return nil
        }
        set {
            if let color = newValue {
                self.setBackgroundColor(color, for: .disabled)
                objc_setAssociatedObject(self, &disabledColorHandle, color, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            } else {
                self.setBackgroundImage(nil, for: .disabled)
                objc_setAssociatedObject(self, &disabledColorHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
}
