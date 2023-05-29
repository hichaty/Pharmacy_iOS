//
//  CheckVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 09/01/22.
//

import UIKit

class CheckVC: UIViewController , UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var CVImage: UICollectionView!
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            return 250.0
        }else if indexPath.row == 1
        {
            return 140.0
        }else if indexPath.row == 2
        {
            return 80.0
        }else if indexPath.row == 3
        {
            return 50.0
        }else if indexPath.row == 4
        {
            return UITableView.automaticDimension
        }else if indexPath.row == 5
        {
            return 50.0
        }else if indexPath.row == 6
        {
            return UITableView.automaticDimension
        }else
        {
            return UITableView.automaticDimension
        }
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 1
        {
            return 7
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: "FirstCell") as! FirstCell
            itemCell.selectionStyle = .none
            return itemCell
        }
        else if indexPath.row == 1
        {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: "SecondCell") as! SecondCell
            itemCell.selectionStyle = .none
            return itemCell
        }
        else if indexPath.row == 2
        {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: "ThirdCell") as! ThirdCell
            itemCell.selectionStyle = .none
            return itemCell
        }
        else if indexPath.row == 3
        {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: "FourthCell") as! FourthCell
            itemCell.selectionStyle = .none
            return itemCell
        }
        else if indexPath.row == 4
        {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: "FifthCell") as! FifthCell
            itemCell.selectionStyle = .none
            return itemCell
        }
        else if indexPath.row == 5
        {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: "SixthCell") as! SixthCell
            itemCell.selectionStyle = .none
            return itemCell
        }
        else if indexPath.row == 6
        {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: "SeventhCell") as! SeventhCell
            itemCell.selectionStyle = .none
            return itemCell
        }else
        {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: "PrescriptionTVCell") as! PrescriptionTVCell
            itemCell.selectionStyle = .none
            return itemCell
        }
        
    }
    
//    private func tableView(tableView: UITableView,
//        willDisplayCell cell: UITableViewCell,
//        forRowAtIndexPath indexPath: NSIndexPath) {
//
//        guard let tableViewCell = cell as? TableViewCell else { return }
//
//        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
//    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            guard let tableViewCell = cell as? FirstCell else { return }
            tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
        }
    }

}

extension CheckVC:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailedCVCell", for: indexPath) as! DetailedCVCell

        return itemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (CVImage.frame.size.width - 20)
        let height = (CVImage.frame.size.height - 20)

        return CGSize(width: width, height: height)
    }
}
