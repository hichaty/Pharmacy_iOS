//
//  PrivacyPolicyVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 04/01/22.
//

import UIKit

class PrivacyPolicyVC: UIViewController
{
    @IBOutlet weak var lblTitle: UILabel!
    
    var type = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
        
        if type == "TermsOfUse"
        {
            lblTitle.text = "TermsOfUse"
        }
        else if type == "PrivacyPolicy"
        {
            lblTitle.text = "PrivacyPolicy"
        }
        else
        {
            lblTitle.text = "Faq"
        }
    }

    @IBAction func btnMenuClk(_ sender: Any)
    {
        AddMenuInNavigation.showMenuView.MenuView(VC: self)
    }
    
    @IBAction func btnCartClk(_ sender: Any)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "MyCartVC") as! MyCartVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
}
