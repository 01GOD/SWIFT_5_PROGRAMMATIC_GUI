//
//  PERCENTAGE-BASED-AUTOLAYOUT_ADDON.swift
//  PROGRAMMATIC_GUI
//
//  Created by GOD on 2/29/20.
//  Copyright © 2020 ALL ONE SUN. All rights reserved.
//
import UIKit
import Foundation

class PercentLayoutConstraint: NSLayoutConstraint {

        @IBInspectable var marginPercent: CGFloat = 0
        
        var screenSize: (width: CGFloat, height: CGFloat) {
            return (UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            layoutDidChange()
            guard marginPercent > 0 else { return }
            NotificationCenter.default.addObserver(self,
                selector: #selector(layoutDidChange),
                name: UIDevice.orientationDidChangeNotification,
                object: nil)
        }
        
        /**
         Re-calculate constant based on orientation and percentage.
         */
    @objc func layoutDidChange() {
            guard marginPercent > 0 else { return }
            
            switch firstAttribute {
            case .top, .topMargin, .bottom, .bottomMargin:
                constant = screenSize.height * marginPercent
            case .leading, .leadingMargin, .trailing, .trailingMargin:
                constant = screenSize.width * marginPercent
            default: break
            }
        }
        
        deinit {
            guard marginPercent > 0 else { return }
            NotificationCenter.default.removeObserver(self)
        }
    }
