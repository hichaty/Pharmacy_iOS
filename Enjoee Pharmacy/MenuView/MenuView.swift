//
//  MenuView.swift
//  MatkaApp
//
//  Created by Ashish Kumar Sharma on 14/07/20.
//  Copyright © 2020 Parasme Software. All rights reserved.
//

import UIKit

class MenuView: UIView
{
    var selfBack: UIViewController?
    
    var senderTag = 1
    
    @IBOutlet weak var lblNotifications: UILabel!
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect)
    {
        
        UIView.animate(withDuration: 0.2) {
            self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }
    }
    
    @IBAction func hideMenu(_ sender: Any)
    {
        UIView.animate(withDuration: 0.2, animations: {
            
            self.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finish) in
            self.removeFromSuperview()
        }
    }

    @IBAction func btnSettingClk(_ sender: Any)
    {
//        let storybord = UIStoryboard(name: "Main", bundle: nil)
//        let VC = storybord.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
//        self.selfBack?.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btnNotification(_ sender: UIButton)
    {
        if senderTag == 1
        {
            lblNotifications.text = "No"
            senderTag = 2
        }else
        {
            lblNotifications.text = "Yes"
            senderTag = 1
        }
    }
    
    @IBAction func btnPrescription(_ sender: Any)
    {
        self.removeFromSuperview()
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "PrescriptionVC") as! PrescriptionVC
        self.selfBack?.navigationController?.pushViewController(VC, animated: true)
    }
    
    
    @IBAction func btnTermsofUse(_ sender: Any)
    {
        self.removeFromSuperview()
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "PrivacyPolicyVC") as! PrivacyPolicyVC
        VC.type = "TermsOfUse"
        self.selfBack?.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btnPrivacyPolicy(_ sender: Any)
    {
        self.removeFromSuperview()
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "PrivacyPolicyVC") as! PrivacyPolicyVC
        VC.type = "PrivacyPolicy"
        self.selfBack?.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btnfaq(_ sender: Any)
    {
        self.removeFromSuperview()
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "PrivacyPolicyVC") as! PrivacyPolicyVC
        VC.type = "Faq"
        self.selfBack?.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btnRateTheApp(_ sender: Any)
    {
//        let storybord = UIStoryboard(name: "Main", bundle: nil)
//        let VC = storybord.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
//        self.selfBack?.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btnLogOut(_ sender: Any)
    {
        self.removeFromSuperview()
        
//        let alert = UIAlertController(title: kAPPName, message: " Are you sure you want to logout?.", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
//            NSLog("Cancel clicked.")
//        }))
//
//        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
//            NSLog("OK clicked.")
            
            KAPPDELEGATE.logOut()
            
        //}))

    }
    
//    func logOut()
//    {
//        let storybord = UIStoryboard(name: "Main", bundle: nil)
//        let VC = storybord.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
//        self.selfBack?.navigationController?.pushViewController(VC, animated: true)
//    }
    
}
    


