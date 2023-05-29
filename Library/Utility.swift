//
//  Utility.swift
//  BLUBUMP
//
//  Created by octal-mac-108 on 04/05/17.
//  Copyright © 2017 Octal. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

import MobileCoreServices

import Photos

//import Alamofire
//import SwiftyJSON

class Utility
{
    
    static let sharedInstance = Utility()
    fileprivate init() {}
    
//    func SendWhatsAppToAdmin() {
//        var phone = Admin_Mobile_Number
//        phone = phone.replacingOccurrences(of: "+", with: "")
//        
//        if let url = URL(string: "https://api.whatsapp.com/send?phone=\(phone)") {
//            UIApplication.shared.open(url)
//        }
//    }
    
    // MARK: get Thumbnail Image from url
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
        
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }
        
        return nil
    }
    
    // MARK: get dateFromString
    func dateFromString(dateStr:String) -> String
    {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from:dateStr)!
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
    
    // MARK: get stringFromDate
    func stringFromDate(date : Date) -> String
    {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
    
    // MARK: set LeftViewMode
    func setLeftViewMode_textField(textField: UITextField, imgName: String, tintColor: UIColor? = nil)
    {
        let txtHeight = textField.frame.height
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: txtHeight))
        
        let imgView = UIImageView(frame: CGRect(x: 10, y: 10, width: 25, height: txtHeight-20))
        imgView.image = UIImage(named: imgName)
        imgView.contentMode = .scaleAspectFit
        imgView.layer.masksToBounds = true
        
        if let color = tintColor
        {
            let newImage = imageTintColorChange(image: imgView.image!)
            imgView.image = newImage
            imgView.tintColor = color
        }
        
        view .addSubview(imgView)
        
        let lbl = UILabel(frame: CGRect(x: 45, y: 10, width: 1, height: 30))
        lbl.backgroundColor = UIColor (red: 223/255.0, green: 223/255.0, blue: 223/255.0, alpha: 1)
        
        view .addSubview(lbl)
        
        textField.leftView = view
        textField.leftViewMode = .always
    }
    
    // MARK: set LeftViewMode
    func setEmptyLeftViewMode_textField(textField: UITextField)
    {
        let txtHeight = textField.frame.height
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: txtHeight))
        
        textField.leftView = view
        textField.leftViewMode = .always
    }
    
    // MARK: set RightViewMode
    func setRightViewMode_textField(textField: UITextField, imgName: String)
    {
        let txtHeight = textField.frame.height
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: txtHeight))
        
        let imgView = UIImageView(frame: CGRect(x: 20, y: 15, width: 20, height: txtHeight-30))
        imgView.image = UIImage(named: imgName)
        imgView.contentMode = .scaleAspectFit
        imgView.layer.masksToBounds = true
        
        view .addSubview(imgView)
        
        textField.rightView = view
        textField.rightViewMode = .always
    }
    
    // MARK:  set Border for textfield
    
    func setBorder_textField(textField: UITextField, Border_Width: CGFloat, Border_Color: UIColor, Corner_Radius: CGFloat)
    {
        textField.layer.borderWidth = Border_Width
        textField.layer.borderColor = Border_Color.cgColor
        textField.layer.cornerRadius = Corner_Radius
        
        textField.layer.masksToBounds = true
    }
    
    // MARK:  Attributed Placeholder for textfield
    
    func setAttributedPlaceHolder_textField(textField: UITextField, PlaceHolder_Text: String, PlaceHolder_Color: UIColor)
    {
        textField.attributedPlaceholder = NSAttributedString (string: PlaceHolder_Text, attributes: [NSAttributedString.Key.foregroundColor : PlaceHolder_Color])
    }
    
    // valid Email
    func isValidEmail(testStr:String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    //Show alert from any page you want
    func showAlert(_ title:String, msg:String, controller:UIViewController)
    {
        let alertController = UIAlertController(title: title,
                                      message: msg,
                                      preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil))
        controller.present(alertController, animated: true, completion: nil)
    }
    
    //Trim a String 
    func trim(_ str:String) -> String
    {
        let trimString:String = str.trimmingCharacters(in: CharacterSet.newlines)
        return trimString.trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    func removeExtraSpacesFromString(str: String) -> String
    {
        var st = String()
        st = str.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let regex = try? NSRegularExpression(pattern: "  +", options: .caseInsensitive)
        let trimmedString: String? = regex?.stringByReplacingMatches(in: st, options: [], range: NSRange(location: 0, length: st.count), withTemplate: " ")
        
        return trimmedString! as String
    }
    
	func heightForView(_ text:String, font:UIFont, width:CGFloat) -> CGFloat{
		let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
		label.numberOfLines = 0
		label.lineBreakMode = NSLineBreakMode.byWordWrapping
		label.font = font
		label.text = text
		
		label.sizeToFit()
		return label.frame.height
	}
    
    
    //Mark: ----- PRAMOD USE THIS FOR API
    
    

//    func postDataInDataForm(header: String,  inVC vc: UIViewController,  completion: @escaping (_ responce : NSDictionary,_ message : String, _ status : Bool) -> ()) {
//
//        let urlString = header
//
//        let escapedAddress = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//
//        Alamofire.request(escapedAddress!, method: .post, encoding: JSONEncoding.default, headers: nil).responseJSON {
//            response in
//            switch response.result {
//            case .success:
//                print(response)
//
//                if let JSON = response.result.value {
//
//
//                    let responce = JSON as! NSDictionary
//
//
//                    let sucess = responce.object(forKey: "status") as! Bool
//
//                    if  sucess != true
//                    {
//                        completion(responce,"false" , false )
//                    }
//                    else
//                    {
//                        completion(responce,"true" , true )
//                    }
//                }
//                break
//            case.failure(let error):
//                print(error)
//                // Utility.sharedInstance.showAlert(kAPPName, msg:error.localizedDescription , controller: vc)
//                break
//            }
//        }
//
//    }
//
//
//
//    func postDataInJson(header: String, withParameter parameter: NSDictionary, inVC vc: UIViewController,  completion: @escaping (_ responce : NSDictionary,_ message : String, _ status : Bool) -> ()) {
//
//        //RappleActivityIndicatorView.startAnimatingWithLabel("Processing...", attributes: RappleAppleAttributes)
//
//        let urlString           = NSString(format: "%@%@",BASE_URL,header)
//
//        print(urlString)
//
//        let jsonData            = try! JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
//
//
//        let jsonString           = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
//
//        print(jsonString)
//
//        let escapedAddress = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//
//        Alamofire.request(escapedAddress!, method: .post, parameters: parameter as? Parameters ,encoding: JSONEncoding.default, headers: nil).responseJSON {
//            response in
//            switch response.result {
//            case .success:
//                print(response)
//
//                if let JSON = response.result.value {
//
//                    let responce = JSON as! NSDictionary
//
//                    let sucess = responce.object(forKey: "status") as! Bool
//
//                    if  sucess != true
//                    {
//                       completion(responce,"false" , false )
//                    }
//                    else
//                    {
//                        completion(responce,"true" , true )
//                    }
//
//                    //RappleActivityIndicatorView.stopAnimation()
//                }
//
//
//                break
//            case .failure(let error):
//                 print(error)
//
//                 Singleton.shared.hide()
//
//               // Utility.sharedInstance.showAlert(kAPPName, msg:error.localizedDescription , controller: vc)
//               // RappleActivityIndicatorView.stopAnimation()
//                break
//            }
//        }
//
//
//    }
    
    //MARK: ------- Image Color Chnage
    
    func imageTintColorChange (image : UIImage ) -> UIImage
    {
        let templateImage = image.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        return templateImage
    }
    
    // MARK: get UIImageFromPHAsset
    func getUIImageFromPHAsset(asset: PHAsset) -> UIImage?
    {
        var img: UIImage?
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.version = .original
        options.isSynchronous = true
        manager.requestImageData(for: asset, options: options) { data, _, _, _ in

            if let data = data {
                img = UIImage(data: data)
            }
        }
        return img
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    //Mark: ------- Navigation bar Gradient Color bg
    
    func set_Navigation_bar_Gradient_Color(VC: UIViewController)
    {
        let gradient = CAGradientLayer()
        
        let height = UIApplication.shared.statusBarFrame.height + (VC.navigationController?.navigationBar.frame.height)!
        
        gradient.frame = CGRect (x: (VC.navigationController?.navigationBar.frame.origin.x)!, y: (VC.navigationController?.navigationBar.frame.origin.y)!, width: (VC.navigationController?.navigationBar.frame.width)!, height: height)
        
        gradient.colors = [UIColor.init(red: 255/255.0, green: 182/255.0, blue: 50/255.0, alpha: 1.0).cgColor, UIColor.init(red: 255/255.0, green: 29/255.0, blue: 92/255.0, alpha: 1.0).cgColor]
        
        VC.navigationController?.navigationBar.setBackgroundImage(self.image_fromLayer(layer: gradient), for: .default)
    }
    
    func image_fromLayer(layer: CALayer) -> UIImage
    {
        UIGraphicsBeginImageContext(layer.frame.size)
        
        layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return outputImage!
    }
    
    // MARK: get mimeTypeForm Path URL
    func mimeTypeForPath(path: String) -> String {
        let url = NSURL(fileURLWithPath: path)
        let pathExtension = url.pathExtension

        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension! as NSString, nil)?.takeRetainedValue() {
            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
                return mimetype as String
            }
        }
        return "application/octet-stream"
    }
    
    // MARK: get ThumbnailImage Form Path/Remote URL
    func getThumbnailImageFromVideoUrl(url: URL,placeHolderImageName: String, completion: @escaping ((_ image: UIImage?)->Void))
    {
        DispatchQueue.global().async {
            let asset = AVAsset(url: url)
            let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
            avAssetImageGenerator.appliesPreferredTrackTransform = true
            let thumnailTime = CMTimeMake(value: 2, timescale: 1)
            //let thumnailTime = CMTimeMake(value: 0, timescale: 1)

            do
            {
                let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil)
                let thumbImage = UIImage(cgImage: cgThumbImage)
                DispatchQueue.main.async {
                    completion(thumbImage)
                }
            } catch
            {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    completion(UIImage(named: placeHolderImageName))
                }
            }
        }
    }
}

