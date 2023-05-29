//
//  MyOrderVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 30/12/21.
//

import UIKit

class MyOrderVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tVOrder: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
        
    }
    

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        self.tabBarController?.tabBar.isHidden = false
        
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150.0
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "MyOrderTVCell") as! MyOrderTVCell
        itemCell.selectionStyle = .none
        return itemCell
    }
    
    @IBAction func btnMenuClk(_ sender: Any)
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
