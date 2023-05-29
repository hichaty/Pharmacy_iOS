//
//  SetPassVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 06/01/22.
//

import UIKit

class SetPassVC: UIViewController
{
    var userId: String?
    
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtConfirmPass: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtPass)
        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtConfirmPass)
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func btnSubmitClk(_ sender: Any)
    {
        if ((txtPass.text?.isEmpty)! || (txtConfirmPass.text?.isEmpty)!)
        {
            Utility.sharedInstance.showAlert("Must fill all fields.", msg: "", controller: self)
        }
         else if ((txtPass.text)! != (txtConfirmPass.text)!)
        {
            Utility.sharedInstance.showAlert("Confirm Password not Match.", msg: "", controller: self)
        }
        else if (txtPass.text?.count)! < 6
        {
            Utility.sharedInstance.showAlert("Password must have atleast 6 Characters.", msg: "", controller: self)
        }
        else
        {
            let storybord = UIStoryboard(name: "Main", bundle: nil)
            let VC = storybord.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    @IBAction func btnLoginHereClk(_ sender: Any)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
   
}
