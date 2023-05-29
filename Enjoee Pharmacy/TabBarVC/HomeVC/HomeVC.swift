//
//  HomeVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 30/12/21.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{

    @IBOutlet weak var mainCollView: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    
    var arrProduct = [[String : AnyObject]]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        
        navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    @IBAction func btnMenuClk(_ sender: Any)
    {
        AddMenuInNavigation.showMenuView.MenuView(VC: self)
    }
    
    @IBAction func BtnCart(_ sender: Any)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "MyCartVC") as! MyCartVC
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let width = (mainCollView.frame.size.width-30)/2
        
        return CGSize(width: width, height: 240.0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollViewCell", for: indexPath) as! ProductCollViewCell
        
        
        
        return itemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "DetailedVC") as! DetailedVC
        
        
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true)
    }
        
    @IBAction func btncategoryClk(_ sender: Any)
    {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "CategorySelect"), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(CatogorySelected(notification:)), name: NSNotification.Name(rawValue: "CategorySelect"), object: nil)
        
        let CategorySelect = Bundle.main.loadNibNamed("CategoryView", owner: self, options: nil)?[0] as! CategoryView
        CategorySelect.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        CategorySelect.selfBack = self
        
        self.view.addSubview(CategorySelect)
                
//        let currentWindow: UIWindow = UIApplication.shared.keyWindow!
//        currentWindow.addSubview(CategorySelect)
    }
    
    @objc func CatogorySelected(notification: NSNotification)
    {
        let dict = notification.userInfo
       // print("lanName: \(dict)")
        //let arrLangName = dict!["Category"] as! [String]
        
        //lblCategory.text = arrLangName.joined(separator: ",")
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "CategorySelect"), object: nil)
    }
    
    
}

extension String
{
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
}
