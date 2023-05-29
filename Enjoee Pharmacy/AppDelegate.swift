//
//  AppDelegate.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 30/12/21.
//

import UIKit

@main class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    
    static var shared: AppDelegate
    {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        IQKeyboardManager.shared.enable = true
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
        SVProgressHUD.setBackgroundColor(UIColor.black)
        
        // Stay Login
        
        print("aaa- \(AUTH_TOKEN)")
        
        if AUTH_TOKEN != ""
        {
            setRootHome()
        }

        return true
    }


}

extension AppDelegate
{
    func setRootHome()
    {
        
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let PEVC = storybord.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootVC = UINavigationController.init(rootViewController: PEVC)
        
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
    }
    
    func logOut()
    {
        RemoveAllUserDefault.RemoveAllKeys.remove()
        USER_DEFAULT.synchronize()
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "token")
        USER_DEFAULT.synchronize()
        
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let PEVC = storybord.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootVC = UINavigationController.init(rootViewController: PEVC)
        
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
    }

}
