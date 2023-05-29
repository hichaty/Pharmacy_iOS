//
//  ForgotPassVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 30/12/21.
//

import UIKit

class ForgotPassVC: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var btnCC: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        txtMobileNo.delegate = self
        txtMobileNo.attributedPlaceholder = NSAttributedString(
            string: "Mobile Number",
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
    
    @IBAction func btnSubmitClk(_ sender: Any)
    {
        if ((txtMobileNo.text?.isEmpty)!)
        {
            Utility.sharedInstance.showAlert("Must fill Mobile No.", msg: "", controller: self)
        }
        else if (btnCC.titleLabel?.text?.isEmpty)!
        {
            Utility.sharedInstance.showAlert("Must Select Country Code", msg: "", controller: self)
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
