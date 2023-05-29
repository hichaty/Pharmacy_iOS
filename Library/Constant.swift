//
//  Constant.swift
//  BLUBUMP
//  Created by octal-mac-108 on 04/05/17.
//  Copyright © 2017 Octal. All rights reserved.
//

import Foundation
import UIKit
//import Alamofire

// https://appone.biz/enjoee-pharmacy/api/
let BASE_URL   = "https://apponedemo.top/enjoee-pharmacy/api/"
let BASE_URL_IMAGE   = "https://apponedemo.top/enjoee-pharmacy/"
//let BASE_URL_Payment   = "https://v12.global/"


let MSGTRY : String = "Please try again later."
let kAPPName : String = "Enjoee Pharmacy"

let googleClientID : String = "918833273540-hp6fa4205u3poo42f19vmq0mbshm4c8i.apps.googleusercontent.com"

let KAPPDELEGATE = AppDelegate.shared

let USER_DEFAULT = UserDefaults.standard

var USER_ID : String = UserDefaults.standard.object(forKey: "user_id") as? String ?? ""

let USER_NAME : String = UserDefaults.standard.object(forKey: "user_name") as! String

var USER_TYPE : Int = UserDefaults.standard.object(forKey: "user_type") as? Int ?? 0

let USER_EMAIL : String = UserDefaults.standard.object(forKey: "user_email") as! String

var FCM_TOKEN : String = UserDefaults.standard.object(forKey: "FCM_TOKEN") as? String ?? ""

//let AUTH_TOKEN : String = UserDefaults.standard.object(forKey: "eNlGiji6LoCm9tKfHj5O3v9J1RSigCyXhaI64I2nWp7DhmIOq4AE9XjJ5PnQ") as! String
var AUTH_TOKEN : String = UserDefaults.standard.object(forKey: "token") as? String ?? ""

let THEME_COLOR = UIColor(red: 0/255.0, green: 145/255.0, blue: 255/255.0, alpha: 1.0)

let AppColorOrange = UIColor(red: 245/255.0, green: 130/255.0, blue: 32/255.0, alpha: 1.0)

let POP_BACK_FROM = { (VC: UIViewController) in
    VC.navigationController?.popViewController(animated: true)
    print("Pop Back From \(VC)")
}

struct SVHUDConstant
{
    static let ShowHud = SVHUDConstant.Start()
    struct Start
    {
        func Show()
        {
            SVProgressHUD.show()
        }

        func ShowLoading()
        {
            SVProgressHUD.show(withStatus: "Loading...")
        }

        func ShowWithMsz(Msz: String)
        {
            SVProgressHUD.show(withStatus: Msz)
        }
    }
    
    static let HideHud = SVHUDConstant.Stop()
    struct Stop
    {
        func Hide()
        {
            SVProgressHUD.dismiss()
        }
    }
    
}
//let SVProgressHUDStart = SVProgressHUD.show(withStatus: "Loading...")


struct RemoveAllUserDefault
{
    static let RemoveAllKeys = RemoveAllUserDefault.removeKeys()
    struct removeKeys
    {
        func remove()
        {
            if let appDomain = Bundle.main.bundleIdentifier
            {
                UserDefaults.standard.removePersistentDomain(forName: appDomain)
            }
        }
    }
}

/*struct AddMenuInNavigation
 {
 static let addMenuView = AddMenuInNavigation.addMenu()
 struct addMenu
 {
 func set_MenuButton_in_Navigation(VC: UIViewController) -> UIButton
 {
 let image3 = UIImage(named: "menu.png")
 let frameimg = CGRect(x: 15, y: 5, width: 25, height: 25)
 
 let someButton = UIButton(frame: frameimg)
 someButton.setBackgroundImage(image3, for: .normal)
 //            someButton.addTarget(self, action: #selector(menu_btn_clk(_:)), for: .touchUpInside)
 someButton.showsTouchWhenHighlighted = true
 
 let menuButton = UIBarButtonItem(customView: someButton)
 VC.navigationItem.leftBarButtonItem = menuButton
 
 return someButton
 }
 }
 
 static let showMenuView = AddMenuInNavigation.showMenu()
 struct showMenu
 {
 func MenuView(VC: UIViewController)
 {
 let menu = Bundle.main.loadNibNamed("MenuView", owner: self, options: nil)?[0] as! MenuView
 menu.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
 menu.selfBack = VC
 //self.view.addSubview(menu)
 
 let currentWindow: UIWindow = UIApplication.shared.keyWindow!
 currentWindow.addSubview(menu)
 }
 }
 }*/

struct AddMenuInNavigation
{
    static let addMenuView = AddMenuInNavigation.addMenu()
    struct addMenu
    {
        func set_MenuButton_in_Navigation(VC: UIViewController) -> UIButton
        {
            let image3 = UIImage(named: "menu.png")
            let frameimg = CGRect(x: 15, y: 5, width: 25, height: 25)
            
            let someButton = UIButton(frame: frameimg)
            someButton.setBackgroundImage(image3, for: .normal)
//            someButton.addTarget(self, action: #selector(menu_btn_clk(_:)), for: .touchUpInside)
            someButton.showsTouchWhenHighlighted = true
            
            let menuButton = UIBarButtonItem(customView: someButton)
            VC.navigationItem.leftBarButtonItem = menuButton
            
            return someButton
        }
    }
    
    static let showMenuView = AddMenuInNavigation.showMenu()
    struct showMenu
    {
        func MenuView(VC: UIViewController)
        {
            let menu = Bundle.main.loadNibNamed("MenuView", owner: self, options: nil)?[0] as! MenuView
            menu.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            menu.selfBack = VC
            //self.view.addSubview(menu)
            
            let currentWindow: UIWindow = UIApplication.shared.keyWindow!
            currentWindow.addSubview(menu)
        }
    }
}


struct Constant
{
    
    //    struct Notifications {
    //        static let kNotificationDidSelectCategory = "SelectCategory"
    //        static let kNotificationPushViewController = "PushViewController"
    //        static let kNotificationUpdateFriendsList = "UpdateFriendsList"
    //        static let kNotificationDidSelectMedia = "DidSelectMedia"
    //        static let kNotificationUserBlocked = "UserBlocked"
    //        static let kNotificationUserBlockedForLogin = "UserBlockedForLogin"
    //        static let kNotificationDidSelectMediaDetail = "DidSelectMediaDetail"
    //        static let kNtificationShowTabbar = "ShowTabbar"
    //        static let kNtificationHideTabbar = "HideTabbar"
    //        static let kNotificationDidSelectEvent = "SelectEvent"
    //        static let kNotificationUserLogout = "UserLogout"
    //        static let kNotificationShowDetail = "ShowDetail"
    //        static let kNotificationHideNavigation = "HideNavigation"
    //        static let kNotificationPopView = "PopView"
    //
    //
    //    }
    
    struct MyVariables
    {
        static var appDelegate = UIApplication.shared.delegate as! AppDelegate
    }
    
    static let font = Constant.Font()
    struct Font
    {
        func SetFontSize(_ fontsize:CGFloat ) -> UIFont
        {
            return UIFont(name:"Brandon Grotesque", size:fontsize)!
        }
    }
    
    static let showPopupView = Constant.showPopup()
    struct showPopup
    {
        func showAlertViewWithAlertView(_ viewAlert : UIView, WithBlackTransperentView viewblackTransperent: UIView, WithAlertShowBool isAlertShow: Bool )
        {
            if isAlertShow
            {
                viewAlert.transform = CGAffineTransform(scaleX: 0, y: 0)
                viewAlert.isHidden = false
                UIView.animate(withDuration: 0.5, animations: { () -> Void in
                    viewAlert.transform = CGAffineTransform.identity
                    viewblackTransperent.isHidden = false
                }, completion: { (isDone) -> Void in
                })
            } else {
                UIView.animate(withDuration: 0.5, animations: { () -> Void in
                    viewAlert.transform = CGAffineTransform.identity
                    viewAlert.transform = CGAffineTransform(scaleX: 0, y: 0)
                    viewblackTransperent.isHidden = true
                }, completion: { (isDone) -> Void in
                    viewAlert.isHidden = true
                })
            }
        }
    }
    
    struct COLOR
    {
        static let Color_App = UIColor(red: 0/255.0, green: 145/255.0, blue: 255/255.0, alpha: 1.0)
        static let Color_BG_2 = UIColor(red: 133/255.0, green: 146/255.0, blue: 201/255.0, alpha: 1.0)
        static let Color_BG_3 = UIColor(red: 189/255.0, green: 139/255.0, blue: 190/255.0, alpha: 1.0)
        static let Color_BG_4 = UIColor(red: 164/255.0, green: 212/255.0, blue: 158/255.0, alpha: 1.0)
        static let Navigation_Color = UIColor(red: 105/255.0, green: 193/255.0, blue: 182/255.0, alpha: 1.0)
        static let ButtonFreezeMap = UIColor(red: 105/255.0, green: 193/255.0, blue: 182/255.0, alpha: 1.0)
        static let ButtonUnfreezeMap = UIColor(red: 8/255.0, green: 57/255.0, blue: 89/255.0, alpha: 1.0)
        static let PopupTableHeader = UIColor(red: 240/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1.0)
        static let Unselected_Text_Color = UIColor(red: 194/255.0, green: 255/255.0, blue: 251/255.0, alpha: 1.0)
    }
    
    struct ScreenNo22
    {
        static let FriendsProfile = 0
        static let InfluencerProfile = 1
        static let Teams = 2
        static let Brands = 3
        static let Continents = 4
        //static let SearchEvent = 5
    }
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    }
    
    //MARK:- QBChat Helper
    static let userDetail = "user_dict"
    static let shareInstance = Constant()
    func storeDataInLocal(_ key: String, _ value: AnyObject)
    {
        
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    func removeLocalStorageData(_ key: String)
    {
        
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func getDataFromLocal(_ key: String) -> AnyObject
    {
        
        return (UserDefaults.standard.object(forKey: key) ?? "") as AnyObject
    }
    
    func convertStringToDictionary(json: String) -> [String: Any]?
    {
        if let data = json.data(using: .utf8)
        {
            do
            {
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: AnyObject]
                return json

            }
            catch
            {
                print(error.localizedDescription)
            }
       }
       return nil
    }
    
    struct QBCredentialsConstant
    {
        
        static let password = "v12QuickBlox"//"V12App123"
        static let applicationID:UInt = 94061//94354
        static let authKey = "HpbdVBBEprbnKK9"//"PNxdwxzuxBPnnKe"
        static let authSecret = "yhwdx75ygP3KZ9M"//"gk3ZT9GvrCsnZDU"
        static let accountKey = "GgQcvxsj9KfhMNUJtEoE"//"LFL3Z6jM4A1aQegLkRoE"
        
//        static let password = "V12App123"
//        static let applicationID:UInt = 94354
//        static let authKey = "PNxdwxzuxBPnnKe"
//        static let authSecret = "gk3ZT9GvrCsnZDU"
//        static let accountKey = "LFL3Z6jM4A1aQegLkRoE"
    }
    
    struct TimeIntervalConstant
    {
        static let answerTimeInterval: TimeInterval = 30.0
        static let dialingTimeInterval: TimeInterval = 5.0
    }

    struct AppDelegateConstant
    {
        static let enableStatsReports: UInt = 1
    }
}
struct AppDelegateVariable
{
    //static var yourVariable = "someString"
    static var appDelegate = UIApplication.shared.delegate as! AppDelegate
}

extension NSDictionary
{
    
    static func fromDictionary<Key: Hashable, Value:AnyObject>(_ dictionary:Dictionary<Key, Value>) -> NSDictionary where Key: NSCopying
    {
        
        let mutableDict : NSMutableDictionary = NSMutableDictionary()
        
        for key in dictionary.keys
        {
            if let value = dictionary[key]
            {
                mutableDict[key] = value
            } else
            {
                mutableDict[key] = NSNull()
            }
        }
        return mutableDict
    }
    
    static func fromDictionary<Key: Hashable, Value:AnyObject>(_ dict: Dictionary<Key, Optional<Value>>) -> NSDictionary where Key: NSCopying
    {
        
        let mutableDict : NSMutableDictionary = NSMutableDictionary()
        
        for key in dict.keys
        {
            if let maybeValue = dict[key]
            {
                if let value = maybeValue
                {
                    mutableDict[key] = value
                } else
                {
                    mutableDict[key] = NSNull()
                }
            }
        }
        return mutableDict
    }
}

extension UIView
{
    func dropShadow()
    {
        self.layer.shadowColor = UIColor(hex: "#53A8CB")?.cgColor
        self.layer.shadowOffset = CGSize.init(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 6.0
        self.layer.masksToBounds = false
    }
}
extension UITextField {
    func setBottomBorder()
    {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.init(red: 245.0/255.0, green: 245.0/255.0, blue: 246.0/255.0, alpha: 1.0).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString?
    {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String
    {
        return htmlToAttributedString?.string ?? ""
    }
}



