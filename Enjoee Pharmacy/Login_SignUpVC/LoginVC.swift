//
//  LoginVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 30/12/21.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnCC: UIButton!
    @IBOutlet weak var txtMobileNO: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
        
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true

        txtMobileNO.delegate = self
        
        txtMobileNO.attributedPlaceholder = NSAttributedString(
            string: "Mobile Number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.GraytextColor])
        
        txtPass.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.GraytextColor])
        
//        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtMobileNO)
//        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtPass)
    }
    
    
    
    // MARK: -  Text Field Fix Character Limit

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                           replacementString string: String) -> Bool
    {
        let maxLength = 10
        let currentString: NSString = txtMobileNO.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    @IBAction func btnCCClk(_ sender: UIButton)
    {
        let alert = UIAlertController(style: .actionSheet, title: "Select Country Code", message: nil)
        alert.addLocalePicker(type: .phoneCode)
        { (info) in
            sender.setTitle(info?.phoneCode, for: .normal)

        }
        alert.addAction(title: "Cancel", style: .cancel)
        alert.show()
    }
    
    @IBAction func btnLoginClk(_ sender: Any)
    {
        if ((txtMobileNO.text?.isEmpty)! || (txtPass.text?.isEmpty)!)
        {
            Utility.sharedInstance.showAlert("Must fill all fields.", msg: "", controller: self)
        }
        else if (btnCC.titleLabel?.text?.isEmpty)!
        {
            Utility.sharedInstance.showAlert("Must Select Country Code", msg: "", controller: self)
        }
        else if (txtPass.text?.count)! < 6
        {
            Utility.sharedInstance.showAlert("Password must have atleast 6 Characters.", msg: "", controller: self)
        }
        else
        {
            let storybord = UIStoryboard(name: "Main", bundle: nil)
            let VC = storybord.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    @IBAction func btnRegisterClk(_ sender: Any)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btnForgotPassClk(_ sender: Any)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "ForgotPassVC") as! ForgotPassVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
}
