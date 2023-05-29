//
//  AlertVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 30/12/21.
//

import UIKit

class AlertVC: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
        
        _ = self.tabBarController?.selectedIndex = 2
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
    
}
