//
//  MyCartVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 04/01/22.
//

import UIKit

class MyCartVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var lblNetAmount: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblShipingCharge: UILabel!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var tvMyCart: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        self.tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150.0
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let itemCell = tableView.dequeueReusableCell(withIdentifier: "MyCartTVCell") as! MyCartTVCell
        itemCell.selectionStyle = .none
        
        itemCell.btnAdd.tag = indexPath.row
        itemCell.lblQuantity.text = String(1)
        
        itemCell.btnAdd.addTarget(self, action: #selector(btnAdd(_:)), for: .touchUpInside)
        
        itemCell.btnMinus.tag = indexPath.row
        itemCell.btnMinus.addTarget(self, action: #selector(btnMinus(_:)), for: .touchUpInside)
        return itemCell
    }
    
    @IBAction func btnAdd(_ sender: UIButton)
    {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let cell = tvMyCart.cellForRow(at: indexPath) as! MyCartTVCell
        cell.count += 1
        cell.lblQuantity.text = "\(cell.count)"
    }
    
    @IBAction func btnMinus(_ sender: UIButton)
    {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        let cell = tvMyCart.cellForRow(at: indexPath) as! MyCartTVCell
        if cell.count > 1
        {
            cell.count -= 1
        }
        cell.lblQuantity.text = "\(cell.count)"
    }
    
    @IBAction func btnBackClk(_ sender: Any)
    {
        POP_BACK_FROM(self)
    }
    
    
    @IBAction func btnCheckOut(_ sender: Any)
    {
        
    }
    
    
}
