//
//  PrescriptionTVCell.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 03/01/22.
//

import UIKit

class PrescriptionTVCell: UITableViewCell
{
    @IBOutlet weak var btnViewPrescription: UIButton!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblMedicineName: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
