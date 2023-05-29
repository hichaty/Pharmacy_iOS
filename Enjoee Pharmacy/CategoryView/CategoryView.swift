//
//  MenuView.swift
//  MatkaApp
//
//  Created by Ashish Kumar Sharma on 14/07/20.
//  Copyright © 2020 Parasme Software. All rights reserved.
//

import UIKit

class CategoryView: UIView, UITableViewDelegate, UITableViewDataSource
{
    var selfBack: UIViewController?

    @IBOutlet var tableViewMenu: UITableView!
    
    let arrMenu = ["Covid Essentials ", "Devices", "Nutrition & Fitness Supplements", "Personal Care", "Ayurvedic Care", "Baby & Mom Care", "Skin Care", "Diabetic Care", "Sexual Wellness", "Short term Ailments","Lifestyle Ailments ", "Home Care", "Women Care", "Health Food & Drinks", "Ortho Care", "Pet Care", "Skin Care", "Diabetic Care", "Sexual Wellness", "Short term Ailments"]
    
    var arrCategory = [[String : AnyObject]]()
    
    override func draw(_ rect: CGRect)
    {
        arrCategory.removeAll()

        UIView.animate(withDuration: 0.2)
        {
            self.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }
    }
    
    @IBAction func hideMenu(_ sender: Any)
    {
        UIView.animate(withDuration: 0.2, animations: {
            
            self.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finish) in
            self.removeFromSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        
        var itemCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if itemCell == nil
        {
            itemCell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        if ((itemCell?.viewWithTag(1234)) != nil) {
            let goView: UIView = (itemCell?.viewWithTag(1234))!
            goView.removeFromSuperview()
        }
        
        let tempView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableViewMenu.frame.width, height: 44))
        tempView.tag = 1234
        tempView.backgroundColor = .white
        itemCell?.addSubview(tempView)
        
        
        let lbl = UILabel(frame: CGRect(x: 0, y: 10, width: tableViewMenu.frame.width-10, height: 44))
        lbl.textAlignment = .right
        lbl.textColor = .black
        lbl.text = arrCategory[indexPath.row]["name"] as? String ?? ""
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: tableViewMenu.frame.width, height: 44))
        btn.tag = indexPath.row
        btn.addTarget(self, action: #selector(btnMenuClk(_:)), for: .touchUpInside)
        
        tempView.addSubview(lbl)
        tempView.addSubview(btn)
        
        return itemCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        self.perform(#selector(hideMenu(_:)), with: nil, afterDelay: 0.2)
        let dict = ["Category" : arrCategory[indexPath.row]["name"]]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CategorySelect"), object: nil, userInfo: dict as [AnyHashable : Any])
    }
    
    @IBAction func btnMenuClk(_ sender: UIButton)
    {
        
    }

 

}
