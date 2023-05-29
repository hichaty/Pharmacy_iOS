//
//  APIManager.swift
//  E-Carl
//
//  Created by Apple on 19/04/19.
//  Copyright © 2019 Parasme Software. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class APIManager: NSObject
{
    static let sharedInstance = APIManager()
    var window: UIWindow?

    func GET(URL: String, inVC vc: UIViewController, completion: @escaping (_ responce : JSON,_ message : String, _ status : Bool) -> ())
    {
        if (Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable)!//!Reachability.singletone!.isReachable
        {
            let urlStr : String = BASE_URL + URL
            
            let UrlString = urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            
            Alamofire.request(UrlString!).responseJSON { (responseData) -> Void in
                c
                {
                    switch responseData.result
                    {
                    case .success:
                        //                    print(responseData)
                        
                        if let Json = responseData.result.value
                        {
                            print("Response:- \(Json)")
                            let swiftyJson = JSON(Json)
                            
                            let success = swiftyJson["code"].intValue
                            
                            if  success != 200
                            {
                                completion(swiftyJson,"false" , false )
                            }
                            else
                            {
                                completion(swiftyJson,"true" , true )
                            }
                            
                        }
                        break
                        
                    case .failure(let error):
                        print(error)
                        
                        SVHUDConstant.HideHud.Hide()
                        
                        Utility.sharedInstance.showAlert(kAPPName, msg:error.localizedDescription , controller: vc)
                        
                        break
                    }
                }
                else
                {
                    SVHUDConstant.HideHud.Hide()
                    
                    Utility.sharedInstance.showAlert(kAPPName, msg:"Something went wrong" , controller: vc)
                }
            }
        }
        else
        {
            SVHUDConstant.HideHud.Hide()
            Utility.sharedInstance.showAlert(kAPPName, msg:"Internet connection error" , controller: vc)
        }
    }
    
    
    func GetWithHeader(URL: String, inVC vc: UIViewController, completion: @escaping (_ responce : JSON,_ message : String, _ status : Bool) -> ())
    {
        if (Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable)!//!Reachability.singletone!.isReachable
        {
            let urlStr : String = BASE_URL + URL
            
            print("url - \(urlStr)")
            let UrlString = urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            
            //let token = "eNlGiji6LoCm9tKfHj5O3v9J1RSigCyXhaI64I2nWp7DhmIOq4AE9XjJ5PnQ"
            let token: String
            if let tok = UserDefaults.standard.object(forKey: "token")
            {
                token = String(format: "Bearer %@", tok as! String)
                print("\(token)")
                //token = tok as! String
            }
            else
            {
                token = "NotLoggedIn"
            }

            Alamofire.request(UrlString!, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization" : token]).responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil)
                {
                    switch responseData.result
                    {
                    case .success:
                        // print(responseData)
                        
                        if let Json = responseData.result.value
                        {
                            
                            let swiftyJson = JSON(Json)
                            
                            let success = swiftyJson["code"].intValue
                            
                            if success != 200
                            {
    //                            if success == 201
    //                            {
    //                                KAPPDELEGATE.logOut()
    //                            }
                                completion(swiftyJson,"false" , false )
                            }
                            else
                            {
                                completion(swiftyJson,"true" , true )
                            }
                          
                        }
                        break
                        
                    case .failure(let error):
                        print(error)
                        
                        SVHUDConstant.HideHud.Hide()
                        
                        Utility.sharedInstance.showAlert(kAPPName, msg:error.localizedDescription , controller: vc)
                        
                        break
                    }
                }
                else
                {
                    SVHUDConstant.HideHud.Hide()
                    
                    Utility.sharedInstance.showAlert(kAPPName, msg:"Something went wrong" , controller: vc)
                }
            }
        }
        else
        {
            SVHUDConstant.HideHud.Hide()
            Utility.sharedInstance.showAlert(kAPPName, msg:"Internet connection error" , controller: vc)
        }
    }
    
    func Post(URL: String, withParameter parameter: NSDictionary, inVC vc: UIViewController = UIViewController(), completion: @escaping (_ responce : JSON,_ message : String, _ status : Bool) -> ())
    {
        if (Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable)!//!Reachability.singletone!.isReachable
        {
            let urlStr : String = BASE_URL + URL
            
            let UrlString = urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            
            let token: String
            if let tok = UserDefaults.standard.object(forKey: "token")
            {
                token = String(format: "Bearer %@", tok as! String)
                //token = tok as! String
            }
            else
            {
                token = "NotLoggedIn"
            }
            
            Alamofire.request(UrlString!, method: .post, parameters: parameter as? Parameters, encoding: JSONEncoding.default, headers: ["Authorization" : token]).responseJSON { (responseData) -> Void in
                if((responseData.result.value) != nil)
                {
                    switch responseData.result
                    {
                    case .success:
    //                    print(responseData)
                        
                        if let Json = responseData.result.value
                        {
                            let swiftyJson = JSON(Json)
                            
                            let success = swiftyJson["code"].intValue
                            
                            if success != 200
                            {
                                completion(swiftyJson,"false" , false )
                            }
                            else
                            {
                                completion(swiftyJson,"true" , true )
                            }
                            
//                            if success == 0
//                            {
//                                let storybord = UIStoryboard(name: "Main", bundle: nil)
//                                let PEVC = storybord.instantiateViewController(withIdentifier: "WalkThroughVC") as! WalkThroughVC
//                                self.window = UIWindow(frame: UIScreen.main.bounds)
//
//                                let rootVC = UINavigationController.init(rootViewController: PEVC)
//
//                                self.window?.rootViewController = rootVC
//                                self.window?.makeKeyAndVisible()
//                            }
                        }
                        break
                        
                    case .failure(let error):
                        print(error)
                        
                        SVHUDConstant.HideHud.Hide()

                        Utility.sharedInstance.showAlert(kAPPName, msg:error.localizedDescription , controller: vc)
                        
                        break
                    }
                }
                else
                {
                    SVHUDConstant.HideHud.Hide()
                    
                    Utility.sharedInstance.showAlert(kAPPName, msg:"Something went wrong" , controller: vc)
                }
            }
        }
        else
        {
            SVHUDConstant.HideHud.Hide()
            Utility.sharedInstance.showAlert(kAPPName, msg:"Internet connection error" , controller: vc)
        }
    }
    
    func PostImage(URL: String, withParameter parameter: [String : String], withImage image: UIImage, inVC vc: UIViewController, completion: @escaping (_ responce : JSON,_ message : String, _ status : Bool) -> ())
    {
        if (Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable)!//!Reachability.singletone!.isReachable
        {
            let urlStr : String = BASE_URL + URL
            
            let UrlString = urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            
            let token: String
            if let tok = UserDefaults.standard.object(forKey: "token")
            {
                token = String(format: "Bearer %@", tok as! String)
                //token = tok as! String
            }
            else
            {
                token = "NotLoggedIn"
            }
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                if let imgData = image.jpegData(compressionQuality: 0.1)
                {
                    multipartFormData.append(imgData, withName: "employer_image", fileName: "profilePic.jpg", mimeType: "image/jpeg")
                }
                
                for (key, value) in parameter
                {
                    multipartFormData.append(value.data(using: .utf8)!, withName: key)
                }
            }, to: UrlString!, method: .post, headers: ["Authorization" : token]) { (encodingResult) in
                switch encodingResult
                {
                case .success(let uploadReq, _, _):
                    uploadReq.responseJSON(completionHandler: { (responseData) in
                        if((responseData.result.value) != nil)
                        {
                            if let Json = responseData.result.value {
                                
                                let swiftyJson = JSON(Json)
                                
                                let success = swiftyJson["code"].intValue
                                
                                if success != 200
                                {
                                    completion(swiftyJson,"false" , false )
                                }
                                else
                                {
                                    completion(swiftyJson,"true" , true )
                                }
                                
//                                if success == 0
//                                {
//                                    let storybord = UIStoryboard(name: "Main", bundle: nil)
//                                    let PEVC = storybord.instantiateViewController(withIdentifier: "WalkThroughVC") as! WalkThroughVC
//                                    self.window = UIWindow(frame: UIScreen.main.bounds)
//
//                                    let rootVC = UINavigationController.init(rootViewController: PEVC)
//
//                                    self.window?.rootViewController = rootVC
//                                    self.window?.makeKeyAndVisible()
//                                }
                            }
                        }
                        else
                        {
                            SVHUDConstant.HideHud.Hide()

                            Utility.sharedInstance.showAlert(kAPPName, msg:"Something went wrong" , controller: vc)
                        }
                    })
                    
                case .failure(let error):
                    print(error)
                    
                    SVHUDConstant.HideHud.Hide()
                    
                    Utility.sharedInstance.showAlert(kAPPName, msg:error.localizedDescription , controller: vc)
                    
                    break
                }
            }
        }
        else
        {
            SVHUDConstant.HideHud.Hide()
            Utility.sharedInstance.showAlert(kAPPName, msg:"Internet connection error" , controller: vc)
        }
    }
    
    func PostWithImageDict(URL: String, withParameter parameter: [AnyHashable : String], withImages imagesDict: [String : UIImage]? = nil, withArray ArrayDict: [String : [[AnyHashable:String]]]? = nil, inVC vc: UIViewController, completion: @escaping (_ responce : JSON,_ message : String, _ status : Bool) -> ())
    {
        if (Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable)!//!Reachability.singletone!.isReachable
        {
            let urlStr : String = BASE_URL + URL
            
            let UrlString = urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            
            //let token = "eNlGiji6LoCm9tKfHj5O3v9J1RSigCyXhaI64I2nWp7DhmIOq4AE9XjJ5PnQ"
            
            let token: String
            if let tok = UserDefaults.standard.object(forKey: "token")
            {
                token = String(format: "Bearer %@", tok as! String)
                //token = tok as! String
            }
            else
            {
                token = "NotLoggedIn"
            }
            
            print("api_url:- \(urlStr)")
            print("header_data:- \(["Authorization" : token])")
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                if let dictImg = imagesDict
                {
                    for (key, value) in dictImg
                    {
                        if let imgData = value.jpegData(compressionQuality: 0.1)
                        {
                            multipartFormData.append(imgData, withName: key, fileName: "\(key).jpg", mimeType: "image/jpeg")
                        }
                    }
                }
                
                for (key, value) in parameter
                {
                    multipartFormData.append(value.data(using: .utf8)!, withName: key as! String)
                }
                
            }, to: UrlString!, method: .post, headers: ["Authorization" : token]) { (encodingResult) in
                switch encodingResult
                {
                case .success(let uploadReq, _, _):
                    uploadReq.responseJSON(completionHandler: { (responseData) in
                        
                       // print("response_data:- \(responseData.result.value)")
                        if((responseData.result.value) != nil)
                        {
                            if let Json = responseData.result.value {
                                
                                let swiftyJson = JSON(Json)
                                
                                let success = swiftyJson["code"].intValue
                                
                                if  success != 200
                                {
                                    completion(swiftyJson,"false" , false )
                                }
                                else
                                {
                                    completion(swiftyJson,"true" , true )
                                }
                                
//                                if success == 0
//                                {
//                                    let storybord = UIStoryboard(name: "Main", bundle: nil)
//                                    let PEVC = storybord.instantiateViewController(withIdentifier: "WalkThroughVC") as! WalkThroughVC
//                                    self.window = UIWindow(frame: UIScreen.main.bounds)
//                                    
//                                    let rootVC = UINavigationController.init(rootViewController: PEVC)
//                                    
//                                    self.window?.rootViewController = rootVC
//                                    self.window?.makeKeyAndVisible()
//                                }
                            }
                        }
                        else
                        {
                            SVHUDConstant.HideHud.Hide()
                            
                            Utility.sharedInstance.showAlert(kAPPName, msg:"Something went wrong" , controller: vc)
                        }
                    })
                    
                case .failure(let error):
                    print("error_message:- ",error.localizedDescription)
                    
                    SVHUDConstant.HideHud.Hide()
                    
                    Utility.sharedInstance.showAlert(kAPPName, msg:error.localizedDescription , controller: vc)
                    
                    break
                }
            }
        }
        else
        {
            SVHUDConstant.HideHud.Hide()
            Utility.sharedInstance.showAlert(kAPPName, msg:"Internet connection error" , controller: vc)
        }
    }
    
//    func PostWithImagePayment(URL: String, withParameter parameter: [String : String], withImages imagesDict: [String : UIImage]? = nil, inVC vc: UIViewController, completion: @escaping (_ responce : JSON,_ message : String, _ status : Bool) -> ())
//    {
//        if (Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable)!//!Reachability.singletone!.isReachable
//        {
//            let urlStr : String = "https://v12.global/" + URL
//
//            let UrlString = urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//
//            //let token = "eNlGiji6LoCm9tKfHj5O3v9J1RSigCyXhaI64I2nWp7DhmIOq4AE9XjJ5PnQ"
//
//            let token: String
//            if let tok = UserDefaults.standard.object(forKey: "token")
//            {
//                token = String(format: "Bearer %@", tok as! String)
//                //token = tok as! String
//            }
//            else
//            {
//                token = "NotLoggedIn"
//            }
//
//            Alamofire.upload(multipartFormData: { (multipartFormData) in
//                if let dictImg = imagesDict
//                {
//                    for (key, value) in dictImg
//                    {
//                        if let imgData = value.jpegData(compressionQuality: 0.1)
//                        {
//                            multipartFormData.append(imgData, withName: key, fileName: "\(key).jpg", mimeType: "image/jpeg")
//                        }
//                    }
//                }
//
//                for (key, value) in parameter
//                {
//                    multipartFormData.append(value.data(using: .utf8)!, withName: key)
//                }
//            }, to: UrlString!, method: .post, headers: ["Authorization" : token]) { (encodingResult) in
//                switch encodingResult
//                {
//                case .success(let uploadReq, _, _):
//                    uploadReq.responseJSON(completionHandler: { (responseData) in
//                        if((responseData.result.value) != nil)
//                        {
//                            if let Json = responseData.result.value {
//
//                                let swiftyJson = JSON(Json)
//
//                                let success = swiftyJson["status"].intValue
//
//                                if  success != 200
//                                {
//                                    completion(swiftyJson,"false" , false )
//                                }
//                                else
//                                {
//                                    completion(swiftyJson,"true" , true )
//                                }
//                            }
//                        }
//                        else
//                        {
//                            SVHUDConstant.HideHud.Hide()
//
//                            Utility.sharedInstance.showAlert(kAPPName, msg:"Something went wrong" , controller: vc)
//                        }
//                    })
//
//                case .failure(let error):
//                    print(error)
//
//                    SVHUDConstant.HideHud.Hide()
//
//                    Utility.sharedInstance.showAlert(kAPPName, msg:error.localizedDescription , controller: vc)
//
//                    break
//                }
//            }
//        }
//        else
//        {
//            SVHUDConstant.HideHud.Hide()
//            Utility.sharedInstance.showAlert(kAPPName, msg:"Internet connection error" , controller: vc)
//        }
//    }
    
//    func PostWithImageDict_FileDict(URL: String, withParameter parameter: [String : Any], withImages imagesDict: [String : UIImage]? = nil, withVideos_Doc videos_DocDict: [String : URL]? = nil, withDataArray arrData: [[String : Any]]? = nil, inVC vc: UIViewController, completion: @escaping (_ responce : JSON,_ message : String, _ status : Bool) -> ())
//    {
//        if (Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable)!//!Reachability.singletone!.isReachable
//        {
//            let urlStr : String = BASE_URL + URL
//
//            let UrlString = urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//
//            //let token = "eNlGiji6LoCm9tKfHj5O3v9J1RSigCyXhaI64I2nWp7DhmIOq4AE9XjJ5PnQ"
//            let token: String
//            if let tok = UserDefaults.standard.object(forKey: "token")
//            {
//                //token = String(format: "Bearer %@", tok as! String)
//                token = tok as! String
//            }
//            else
//            {
//                token = "NotLoggedIn"
//            }
//
//            Alamofire.upload(multipartFormData: { (multipartFormData) in
//                if let dictImg = imagesDict
//                {
//                    for (key, value) in dictImg
//                    {
//                        if let imgData = value.jpegData(compressionQuality: 0.1)
//                        {
//                            multipartFormData.append(imgData, withName: key, fileName: "\(key).jpg", mimeType: "image/jpeg")
//                        }
//                    }
//                }
//
//                if let dictVideo_Doc = videos_DocDict
//                {
//                    for (key, value) in dictVideo_Doc
//                    {
//                        do {
//                            let mimeType = Utility.sharedInstance.mimeTypeForPath(path: String(format: "%@", value as CVarArg))
//
//                            let video_Doc_Data = try Data(contentsOf: value)
//
//                            let fileName = "\(key)_\(value.lastPathComponent)"
//                            multipartFormData.append(video_Doc_Data, withName: key, fileName: fileName, mimeType: mimeType)
//                        } catch let error {
//                            print(error)
//                        }
//                    }
//                }
//
//                if let arrayData = arrData
//                {
//                    for item in arrayData
//                    {
//                        let mimeType = item["mimeType"] as! String
//                        let fileName = item["fileName"] as! String
//                        let key = item["key"] as! String
//                        let data = item["data"] as! Data
//
//                        multipartFormData.append(data, withName: key, fileName: fileName, mimeType: mimeType)
//                    }
//                }
//
//                for (key, value) in parameter
//                {
//                    if key == "education_data" || key == "experiance_data" {
//                        let arrData =  try! JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
//                        multipartFormData.append(arrData, withName: key as String)
//                    } else {
//                        multipartFormData.append("\(value)".data(using: .utf8)!, withName: key)
//                    }
//                }
//            }, to: UrlString!, method: .post, headers: ["Authorization" : token]) { (encodingResult) in
//                switch encodingResult
//                {
//                case .success(let uploadReq, _, _):
//                    uploadReq.responseJSON(completionHandler: { (responseData) in
//                        if((responseData.result.value) != nil)
//                        {
//                            if let Json = responseData.result.value
//                            {
//
//                                let swiftyJson = JSON(Json)
//
//                                let success = swiftyJson["status"].boolValue
//
//                                if  !success
//                                {
//                                    completion(swiftyJson,"false" , false )
//                                }
//                                else
//                                {
//                                    completion(swiftyJson,"true" , true )
//                                }
//                            }
//                        }
//                        else
//                        {
//                            SVHUDConstant.HideHud.Hide()
//
//                            Utility.sharedInstance.showAlert(kAPPName, msg:"Something went wrong" , controller: vc)
//                        }
//                    })
//
//                case .failure(let error):
//                    print(error)
//
//                    SVHUDConstant.HideHud.Hide()
//
//                    Utility.sharedInstance.showAlert(kAPPName, msg:error.localizedDescription , controller: vc)
//
//                    break
//                }
//            }
//        }
//        else
//        {
//            SVHUDConstant.HideHud.Hide()
//            Utility.sharedInstance.showAlert(kAPPName, msg:"Internet connection error" , controller: vc)
//        }
//    }
//
//    func downloadZipFile(_ zipFileURL:String, controller : UIViewController, isHudVisible:Bool) {
//
//        if (Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable)!
//        {
//            let url = URL(string: zipFileURL)!
//            let fileName = String((url.lastPathComponent)) as NSString
//            // Create destination URL
//            let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//            let destinationFileUrl = documentsUrl.appendingPathComponent("\(fileName)")
//            //Create URL to the source file you want to download
//            let fileURL = URL(string: zipFileURL)
//            let sessionConfig = URLSessionConfiguration.default
//            let session = URLSession(configuration: sessionConfig)
//            let request = URLRequest(url:fileURL!)
//
//            let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
//
//                if let tempLocalUrl = tempLocalUrl, error == nil {
//                    // Success
//                    DispatchQueue.main.async {
//                        SVHUDConstant.HideHud.Hide()
//                    }
//                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
//
//                        print("Successfully downloaded. Status code: \(statusCode)")
//                    }
//                    do {
//                        try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
//                        do {
//                            //Show UIActivityViewController to save the downloaded file
//                            let contents  = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
//                            for indexx in 0..<contents.count {
//                                if contents[indexx].lastPathComponent == destinationFileUrl.lastPathComponent {
//
//                                    OperationQueue.main.addOperation {
//                                        let activityViewController = UIActivityViewController(activityItems: [contents[indexx]], applicationActivities: nil)
//                                        controller.present(activityViewController, animated: true, completion: nil)
//                                    }
//                                }
//                            }
//                        }
//                        catch (let err) {
//                            print("error: \(err)")
//                        }
//                    } catch (let writeError) {
//                        print("Error creating a file \(destinationFileUrl) : \(writeError)")
//                        DispatchQueue.main.async {
//                            Utility.sharedInstance.showAlert(kAPPName, msg:"Same File name already exists. " , controller: controller)
//                        }
//
//                    }
//                } else {
//                    print("Error took place while downloading a file. Error description: \(error?.localizedDescription ?? "")")
//                }
//            }
//            task.resume()
//
//        }
//        else
//        {
//            SVHUDConstant.HideHud.Hide()
//            Utility.sharedInstance.showAlert(kAPPName, msg:"Internet connection error" , controller: controller)
//        }
//    }
//    func PostZipFile(URL: String, withParameter parameter: [String : String], arrMediaFileData:NSArray, inVC vc: UIViewController, completion: @escaping (_ responce : JSON,_ message : String, _ status : Bool) -> ())
//    {
//        if (Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable)!//!Reachability.singletone!.isReachable
//        {
//            let urlStr : String = BASE_URL + URL
//
//            let UrlString = urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
//
//            let token: String
//            if let tok = UserDefaults.standard.object(forKey: "token")
//            {
//                token = tok as! String
//            }
//            else
//            {
//                token = "NotLoggedIn"
//            }
//
//            Alamofire.upload(multipartFormData: { (multipartFormData) in
//
//                if arrMediaFileData.count > 0
//                {
//                    for item in arrMediaFileData
//                    {
//                        if let objectMultipart = item as? NSDictionary {
//
//                            if ((objectMultipart["mediaData"] as? Data ?? Data()) != Data())
//                            {
//                                let imgKey = (objectMultipart["mediaKey"] as? String ?? "")
//                                var rng = SystemRandomNumberGenerator()
//                                let randomInt = Int.random(in: 1...100, using: &rng)
//                                let fileName = kAPPName.appending("\(randomInt)")
//
//                                if (objectMultipart["mediaData"] as? Data) != nil
//                                {
//                                    multipartFormData.append((objectMultipart["mediaData"] as? Data ?? Data()), withName: "\(imgKey)", fileName: "\(fileName).\(objectMultipart["fileExtension"] as? String ?? "")", mimeType:(objectMultipart["mimeType"] as? String ?? ""))
//                                }
//                            }
//                        }
//                    }
//                }
//                for (key, value) in parameter
//                {
//                    multipartFormData.append(value.data(using: .utf8)!, withName: key)
//                }
//            }, to: UrlString!, method: .post, headers: ["token" : token]) { (encodingResult) in
//                switch encodingResult
//                {
//                case .success(let uploadReq, _, _):
//                    uploadReq.responseJSON(completionHandler: { (responseData) in
//                        if((responseData.result.value) != nil)
//                        {
//                            if let Json = responseData.result.value {
//
//                                let swiftyJson = JSON(Json)
//
//                                let success = swiftyJson["status"].intValue
//
//                                if success != 200
//                                {
//                                    completion(swiftyJson,"false" , false )
//                                }
//                                else
//                                {
//                                    completion(swiftyJson,"true" , true )
//                                }
//                            }
//                        }
//                        else
//                        {
//                            SVHUDConstant.HideHud.Hide()
//
//                            Utility.sharedInstance.showAlert(kAPPName, msg:"Something went wrong" , controller: vc)
//                        }
//                    })
//
//                case .failure(let error):
//                    print(error)
//
//                    SVHUDConstant.HideHud.Hide()
//
//                    Utility.sharedInstance.showAlert(kAPPName, msg:error.localizedDescription , controller: vc)
//
//                    break
//                }
//            }
//        }
//        else
//        {
//            SVHUDConstant.HideHud.Hide()
//            Utility.sharedInstance.showAlert(kAPPName, msg:"Internet connection error" , controller: vc)
//        }
//    }
    
}
