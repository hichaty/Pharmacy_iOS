//
//  UIColor.swift
//  ShowToStream
//
//  Created by Piyush Chopra on 15/12/20.
//  Copyright © 2020 Piyush Chopra. All rights reserved.
//

import UIKit

extension UIColor {
    class var GraytextColor: UIColor {
        return UIColor(named: "GraytextColor")!
    }
    
    class var appYellow: UIColor {
        return UIColor(named: "AppYellow")!
    }
    
    class var HomeAppBgColor: UIColor {
        return UIColor(named: "HomeAppBgColor")!
    }
    
    class var bgAllView: UIColor {
        return UIColor(named: "bgAllView")!
    }
    
//    class var unselectedTabBarItem: UIColor {
//        return UIColor(named: "UnselectedTabBarItem")!
//    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            } else if hexColor.count == 6 {
                var rgbValue:UInt64 = 0
                Scanner(string: hexColor).scanHexInt64(&rgbValue)
                
                r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
                g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
                b = CGFloat(rgbValue & 0x0000FF) / 255.0
                a = CGFloat(1.0)

                self.init(red: r, green: g, blue: b, alpha: a)
                return

            }
        }
        return nil
    }
    
}
