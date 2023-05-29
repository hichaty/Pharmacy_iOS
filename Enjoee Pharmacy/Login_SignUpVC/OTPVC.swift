//
//  OTPVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 30/12/21.
//

import UIKit

class OTPVC: UIViewController, UITextFieldDelegate
{
    
    var type = ""
    var mobileNo: String?
    var userId: String?
    var countryCode: String?

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var txtOtp: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var btnCC: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        txtOtp.delegate = self
        txtOtp.attributedPlaceholder = NSAttributedString(
            string: "Enter OTP",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.GraytextColor])
        
        txtMobileNo.text = mobileNo
        btnCC.setTitle(countryCode, for: .normal)
        btnBack.imageView?.tintColor = .black
    }
    
    // MARK: -  Text Field Fix Character Limit

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                           replacementString string: String) -> Bool
    {
        let maxLength = 4
        let currentString: NSString = txtOtp.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    @IBAction func btnSubmitClk(_ sender: Any)
    {
        if (txtOtp.text?.isEmpty)!
        {
            Utility.sharedInstance.showAlert("Must fill Otp.", msg: "", controller: self)
        }
        else
        {
            let storybord = UIStoryboard(name: "Main", bundle: nil)
            let VC = storybord.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    @IBAction func btnLoginClk(_ sender: Any)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btnResendOtp(_ sender: Any)
    {
    }
    
    @IBAction func btnBackClk(_ sender: Any)
    {
        POP_BACK_FROM(self)
    }
    
}
