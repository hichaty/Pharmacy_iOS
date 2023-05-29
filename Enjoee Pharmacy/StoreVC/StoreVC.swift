//
//  StoreVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 08/01/22.
//

import UIKit

class StoreVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var CVMain: UICollectionView!
    
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (CVMain.frame.size.width-30)/2
        
        return CGSize(width: width, height: 250.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCVCell", for: indexPath) as! StoreCVCell
        
        itemCell.viewMain.dropShadow()
        return itemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "PrescriptionVC") as! PrescriptionVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btmMenuClk(_ sender: Any)
    {
        AddMenuInNavigation.showMenuView.MenuView(VC: self)
    }
    
    @IBAction func btnCartClk(_ sender: Any)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "MyCartVC") as! MyCartVC
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
}
