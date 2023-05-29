//
//  MyCartTVCell.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 04/01/22.
//

import UIKit

class MyCartTVCell: UITableViewCell {
    
    var count = 1
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var btnUploadPrescriptions: UIButton!
    @IBOutlet weak var btnReject: UIButton!
    
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
