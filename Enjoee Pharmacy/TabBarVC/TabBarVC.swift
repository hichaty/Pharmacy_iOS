//
//  TabBarVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 30/12/21.
//

import UIKit

class TabBarVC: UITabBarController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().isTranslucent = false

    }
        
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
//        let numberOfItems = CGFloat(tabBar.items!.count)
//        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
//        tabBar.selectionIndicatorImage = UIImage.imageWithColor(.systemOrange, size: tabBarItemSize).resizableImage(withCapInsets: UIEdgeInsets.zero)
//
//        tabBar.frame.size.width = self.view.frame.width + 5
//        tabBar.frame.origin.x = -3
        
        if let items = tabBar.items
        {
            for index in 0..<items.count
            {
                let item = items[index]
                
                switch index {
                case 0:
                    item.selectedImage = #imageLiteral(resourceName: "bellselect").withRenderingMode(.alwaysOriginal)
                    item.image = #imageLiteral(resourceName: "Alert ") //.withRenderingMode(.alwaysOriginal)
                    item.title = "Alert"
                case 1:
                    item.selectedImage = #imageLiteral(resourceName: "NearStoreSelect ").withRenderingMode(.alwaysOriginal)
                    item.image = #imageLiteral(resourceName: "NearStore ") //.withRenderingMode(.alwaysOriginal)
                    item.title = "Near Store"
                case 2:
                    item.selectedImage = #imageLiteral(resourceName: "SelectHome ").withRenderingMode(.alwaysOriginal)
                    item.image = #imageLiteral(resourceName: "SelectHome ") //.withRenderingMode(.alwaysOriginal)
                    item.title = "Home"
                case 3:
                    item.selectedImage = #imageLiteral(resourceName: "MY ORder ").withRenderingMode(.alwaysOriginal)
                    item.image = #imageLiteral(resourceName: "MY ORder ") //.withRenderingMode(.alwaysOriginal)
                    item.title = "My Order"
                case 4:
                    item.selectedImage = #imageLiteral(resourceName: "SelectProfile ").withRenderingMode(.alwaysOriginal)
                    item.image = #imageLiteral(resourceName: "SelectProfile ") //.withRenderingMode(.alwaysOriginal)
                    item.title = "Profile"
                default:
                    break
                }
                

                item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.robotoBoldFont(with: 13),
                                             NSAttributedString.Key.foregroundColor: UIColor.unselectedTabBarItem], for: .selected)
                item.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.robotoBoldFont(with: 13),
                                             NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)

            }
        }
    }
}

extension UIImage
{
    class func imageWithColor(_ color: UIColor, size: CGSize) -> UIImage
    {
        let rect: CGRect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: size.width, height: size.height))
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
}

extension UIColor
{
    class var unselectedTabBarItem: UIColor
    {
        return UIColor(named: "UnselectedTabBarItem")!
    }
}
