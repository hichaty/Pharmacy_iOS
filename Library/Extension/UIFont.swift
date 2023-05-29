//
//  UIFont.swift
//  ShowToStream
//
//  Created by Piyush Chopra on 15/12/20.
//  Copyright © 2020 Piyush Chopra. All rights reserved.
//

import UIKit

// MARK: - UIFont Extension
extension UIFont {
        
    class func robotoBlackFont(with size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Black",
                      size: size)!
    }
    
    class func robotoBoldFont(with size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold",
                      size: size)!
    }

    class func robotoLightFont(with size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Light",
                      size: size)!
    }

    class func robotoMediumFont(with size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Medium",
                      size: size)!
    }

    class func robotoRegularFont(with size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular",
                      size: size)!
    }
    
    class func robotoThinFont(with size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Thin",
                      size: size)!
    }
}
