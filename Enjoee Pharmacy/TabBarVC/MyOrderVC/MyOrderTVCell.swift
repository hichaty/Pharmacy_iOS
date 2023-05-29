//
//  MyOrderTVCell.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 03/01/22.
//

import UIKit

class MyOrderTVCell: UITableViewCell
{
    @IBOutlet weak var lblOderdate: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var btnRepeatOrder: UIButton!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
