//
//  ProfileVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 30/12/21.
//

import UIKit

class ProfileVC: UIViewController
{
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblMobileNo: UILabel!
    
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblDOB: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblBloodGroup: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblAnyAllegies: UILabel!
    
    @IBOutlet weak var lblAddressFirst: UILabel!
    @IBOutlet weak var lblAddressSecond: UILabel!
    
    @IBOutlet weak var viewAddrssFirst: UIView!
    @IBOutlet weak var viewAddressSecond: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    @IBAction func btnMenuClk(_ sender: Any)
    {
        AddMenuInNavigation.showMenuView.MenuView(VC: self)
    }
    
    @IBAction func btnCartClk(_ sender: Any)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "MyCartVC") as! MyCartVC
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btnProfileEditClk(_ sender: Any)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btnAddAddressClk(_ sender: Any)
    {
       
    }
    
    
}
