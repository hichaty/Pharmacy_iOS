//
//  EditProfileVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 20/01/22.
//

import UIKit

class EditProfileVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource
{
    let imagePicker = UIImagePickerController()
    var isNewImage = false
    
    var genderPickerView : UIPickerView!
    var BloodPickerView : UIPickerView!
    var HeightPickerView : UIPickerView!
    var WeightPickerView : UIPickerView!
    var AnyAligentPickerView : UIPickerView!

    var arrGender = ["male", "Female"]            // first array for first textfield
    
    var arrBlood = ["O", "O+", "B", "B+", "O-"]              //array for 2nd textfield
    
    var arrHeight = ["100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200"]                //array for 3rd textfield
    
    var arrWeight = ["10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200"]                //array for 3rd textfield
    
    
    var arrAlligent = ["Yes", "No"]            // fourth array for first textfield
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMobileNo: UITextField!
    @IBOutlet weak var btnCC: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtDOB: UITextField!
    @IBOutlet weak var txtLocation: UITextField!
    @IBOutlet weak var txtBloodGroup: UITextField!
    @IBOutlet weak var txtHeight: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var txtAnyAlligies: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userProfile_hud()
        
        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtName)
        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtEmail)
        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtGender)
        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtDOB)
        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtLocation)
        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtBloodGroup)
        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtHeight)
        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtWeight)
        Utility.sharedInstance.setEmptyLeftViewMode_textField(textField: txtAnyAlligies)
        
        
        genderPickerView = UIPickerView()
        BloodPickerView = UIPickerView()
        HeightPickerView = UIPickerView()
        WeightPickerView = UIPickerView()
        AnyAligentPickerView = UIPickerView()
        
        genderPickerView.dataSource = self
        BloodPickerView.dataSource = self
        HeightPickerView.dataSource = self
        WeightPickerView.dataSource = self
        AnyAligentPickerView.dataSource = self
        
        genderPickerView.delegate = self
        BloodPickerView.delegate = self
        HeightPickerView.delegate = self
        WeightPickerView.delegate = self
        AnyAligentPickerView.delegate = self
        
        txtGender.inputView = genderPickerView
        txtBloodGroup.inputView = BloodPickerView      // I suppose that's the name of textbox ?
        txtHeight.inputView = HeightPickerView
        txtWeight.inputView = WeightPickerView
        txtAnyAlligies.inputView = AnyAligentPickerView
    }
 
    // MARK: - Gender, Height, Weight, Any Alligies and BloodGroup PickerView DataSource and Delegate
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == genderPickerView
        {
            return arrGender.count
        }
        else if  pickerView == BloodPickerView       // safer in case you add a third picker some day
        {
            return arrBlood.count
        }
        else if  pickerView == HeightPickerView          // safer in case you add a third picker some day
        {
            return arrHeight.count
        }
        else if  pickerView == WeightPickerView          // safer in case you add a third picker some day
        {
            return arrWeight.count
        }
        else if  pickerView == AnyAligentPickerView          // safer in case you add a third picker some day
        {
            return arrAlligent.count
        }
        else
        {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == genderPickerView
        {
            return arrGender[row]
        }
        else if  pickerView == BloodPickerView                // safer in case you add a third picker some day
        {
            return arrBlood[row]
        }
        else if  pickerView == HeightPickerView                // safer in case you add a third picker some day
        {
            return arrHeight[row]
        }
        else if  pickerView == WeightPickerView                // safer in case you add a third picker some day
        {
            return arrWeight[row]
        }
        else if  pickerView == AnyAligentPickerView                // safer in case you add a third picker some day
        {
            return arrAlligent[row]
        }
        else
        {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if pickerView == genderPickerView

        {
            txtGender.text = arrGender[row]
        }
        else if  pickerView == BloodPickerView                                   // safer in case you add a third picker some day
        {
            txtBloodGroup.text = arrBlood[row]
        }
        else if  pickerView == HeightPickerView                                   // safer in case you add a third picker some day
        {
            txtHeight.text = arrHeight[row]
        }
        else if  pickerView == WeightPickerView                                   // safer in case you add a third picker some day
        {
            txtWeight.text = arrWeight[row]
        }
        else if  pickerView == AnyAligentPickerView                                   // safer in case you add a third picker some day
        {
            txtAnyAlligies.text = arrAlligent[row]
        }
        else
        {
        }
    }
    
    @IBAction func btnBackClk(_ sender: Any)
    {
        POP_BACK_FROM(self)
    }
    
    // MARK: -  set User Profile Image
    @IBAction func btnEditClk(_ sender: Any)
    {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        {
            imgUser.image = pickedImage
            isNewImage = true
        }
        picker.dismiss(animated: true, completion: nil)
    }
    //*****************************************
    
    
    @IBAction func btnDOBClk(_ sender: Any)
    {
        let alert = UIAlertController(style: .actionSheet, title: "Select Date of Birth", message: nil)
                
        alert.addDatePicker(mode: .date, date: nil, minimumDate: nil, maximumDate: nil) { (date) in
            let strDate = Utility.sharedInstance.stringFromDate(date: date)
            self.txtDOB.text = strDate
        }
        alert.addAction(title: "Done", style: .cancel)
        alert.show()
    }
    
    
    @IBAction func btnSubmitClk(_ sender: Any)
    {
        UpdateProfile_Hud()
    }
    
    // MARK: -  UpdateProfile Api

    func UpdateProfile_Hud() -> Void
    {
        //let countryCode = btnCC.titleLabel?.text
        
        let dict = ["name": txtName.text!, "profile": txtEmail.text!]
        
        print("Dict - \(dict)")
        
        var dicImage : [String : UIImage]? = nil
        
        if isNewImage
        {
            dicImage = ["profile": imgUser.image!]
        }else
        {
            dicImage = ["profile": imgUser.image!]
        }

        SVHUDConstant.ShowHud.ShowLoading()

        // https://appone.biz/kapde/api/update-profile
        
        APIManager.sharedInstance.PostWithImageDict(URL: "update-profile", withParameter: dict, withImages: dicImage, withArray: nil, inVC: self) { (Json, error, success) in
        

            SVHUDConstant.HideHud.Hide()

            print("data -- \(Json)")

            if success
            {
               
                self.view.makeToast("Profile update successfully.")
                let storybord = UIStoryboard(name: "Main", bundle: nil)
                let VC = storybord.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
                self.navigationController?.pushViewController(VC, animated: true)
                
            }
            else
            {
                let msz = Json["message"].stringValue

                Utility.sharedInstance.showAlert(kAPPName, msg:msz , controller: self)
            }
        }
    }
    
    func userProfile_hud()
    {
        SVHUDConstant.ShowHud.ShowLoading()
        
        // https://appone.biz/kapde/api/profile
        //APIManager.sharedInstance.GET(URL: "user_jobs", inVC: self) { (Json, error, success) in
        APIManager.sharedInstance.GetWithHeader(URL: "profile", inVC: self) { (Json, error, success) in
            
            SVHUDConstant.HideHud.Hide()
            
            print("data -- \(Json)")
            
            if success
            {
                let userJson = Json["data"].dictionaryObject
                self.txtName.text = userJson!["name"] as? String ?? ""
                self.txtEmail.text = userJson!["email"] as? String ?? ""
                
                let CountryCode = userJson!["country_code"] as? String ?? ""
                self.btnCC.setTitle(CountryCode, for: .normal)
                self.txtMobileNo.text = userJson!["mobile"] as? String ?? ""
                
                self.txtGender.text = userJson!["pincode"] as? String ?? ""
                self.txtDOB.text = userJson!["refer_code"] as? String ?? ""

                
                let imgUrl = userJson!["profile"] as? String
                //let baseUrl = userJson!["img_base_path"] as? String
                
                if (imgUrl != nil)
                {
                    let strImage = BASE_URL_IMAGE + imgUrl!
                    
                    print("base url = \(strImage)")
                    self.imgUser.sd_setImage(with: URL(string: strImage), placeholderImage: UIImage(named: "user.png"))
                }
                
            }
            else
            {
                let msz = Json["message"].stringValue
                
                Utility.sharedInstance.showAlert(kAPPName, msg:msz , controller: self)
            }
        }
    }
    
}
