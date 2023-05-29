//
//  SignUpVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 30/12/21.
//

import UIKit

class SignUpVC: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var btnCC: UIButton!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    
    var userId = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        txtMobileNo.delegate = self
        
        txtMobileNo.attributedPlaceholder = NSAttributedString(
            string: "Mobile Number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.GraytextColor])
        
        txtPass.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.GraytextColor])
        txtFullName.attributedPlaceholder = NSAttributedString(
            string: "Full Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.GraytextColor])

    }
    
    // MARK: -  Text Field Fix Character Limit
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                           replacementString string: String) -> Bool
    {
        let maxLength = 10
        let currentString: NSString = txtMobileNo.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    

    @IBAction func btnRegisterClk(_ sender: Any)
    {
        if ((txtMobileNo.text?.isEmpty)! || (txtFullName.text?.isEmpty)! || (txtPass.text?.isEmpty)!)
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
            let VC = storybord.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    @IBAction func btnLoginHereClk(_ sender: Any)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btnCountryCodeClk(_ sender: UIButton)
    {
        let alert = UIAlertController(style: .actionSheet, title: "Select Country Code", message: nil)
        alert.addLocalePicker(type: .phoneCode)
        { (info) in
            sender.setTitle(info?.phoneCode, for: .normal)

        }
        alert.addAction(title: "Cancel", style: .cancel)
        alert.show()
    }
    
    
    
}
