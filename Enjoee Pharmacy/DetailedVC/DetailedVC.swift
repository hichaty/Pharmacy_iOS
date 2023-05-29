//
//  DetailedVC.swift
//  Enjoee Pharmacy
//
//  Created by Parasme software and technology on 04/01/22.
//

import UIKit

class DetailedVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var cvImage: UICollectionView!
    
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblMfg: UILabel!
    @IBOutlet weak var lblDiscountPercentage: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblStore: UILabel!
    @IBOutlet weak var textViewMedicaldescription: UITextView!
    
    @IBOutlet weak var lblStrenght: UILabel!
    
    @IBOutlet weak var textViewDisclaimer: UITextView!
    
    @IBOutlet weak var imgProductDetail: UIImageView!
    @IBOutlet weak var imgUses: UIImageView!
    @IBOutlet weak var imgWarnngPrecautions: UIImageView!
    @IBOutlet weak var imgInteractions: UIImageView!
    @IBOutlet weak var imgDirections: UIImageView!
    @IBOutlet weak var imgSideEffect: UIImageView!
    @IBOutlet weak var imgMoreInfo: UIImageView!
    
    @IBOutlet weak var lblProductDetail: UILabel!
    @IBOutlet weak var lblUses: UILabel!
    @IBOutlet weak var lblWarningPrecaution: UILabel!
    @IBOutlet weak var lblInteraction: UILabel!
    @IBOutlet weak var lblDirectionForUse: UILabel!
    @IBOutlet weak var lblSideEffect: UILabel!
    @IBOutlet weak var lblMoreInfo: UILabel!
    
    var productDetail = 1
    var uses = 1
    var warningPrecautions = 1
    var interactions = 1
    var directionsForUse = 1
    var sideEffects = 1
    var moreInfo = 1
    
    
    var arrProduct = [String : AnyObject]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        cvImage.maskToBounds = true
        cvImage.clipsToBounds = true
        
        lblProductName.text = arrProduct["product_name"] as? String ?? ""
        
        let mrp = arrProduct["mrp"] as? String ?? ""
        let salePrice = (arrProduct["sale_price"] as? String ?? "")
        
        lblPrice.attributedText = "Rs. \(mrp) | Rs. \(salePrice)".strikethrough
        
        lblTitle.text = arrProduct["product_name"] as? String ?? ""
        
        lblMfg.text = arrProduct["name_of_manufacturer_marketer"] as? String ?? ""
        
        lblProductDetail.text = arrProduct["ingredient"] as? String ?? ""
        lblUses.text = arrProduct["uses"] as? String ?? ""
        lblWarningPrecaution.text = arrProduct["warning_precautions"] as? String ?? ""
        lblInteraction.text = arrProduct["interactions"] as? String ?? ""
        lblDirectionForUse.text = arrProduct["directions_to_use"] as? String ?? ""
        lblSideEffect.text = arrProduct["side_effects"] as? String ?? ""
        lblMoreInfo.text = arrProduct["more_info"] as? String ?? ""
        
        textViewMedicaldescription.text = arrProduct["descriptions"] as? String ?? ""
        
        lblStrenght.text = arrProduct["strength"] as? String ?? ""
        
        textViewDisclaimer.text = arrProduct["disclaimer"] as? String ?? ""

        print("arrProduct :  \(arrProduct)")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailedCVCell", for: indexPath) as! DetailedCVCell
        
        let imgUrl = arrProduct["image"] as? String
        
        if (imgUrl != nil)
        {
            let strImage = imgUrl
           // print("base url = \(strImage)")
            itemCell.imgProduct.sd_setImage(with: URL(string: strImage!), placeholderImage: UIImage(named: "noimage.png"))
        }

        return itemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (cvImage.frame.size.width - 20)
        let height = (cvImage.frame.size.height - 20)

        return CGSize(width: width, height: height)
    }

//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)
//    {
//        pageControll.currentPage = indexPath.row
//    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
//    {
//        if indexPath.row > 2 &&  indexPath.row <= 8
//        {
//            let storybord = UIStoryboard(name: "Main", bundle: nil)
//            let VC = storybord.instantiateViewController(withIdentifier: "ScoreCardVC") as! ScoreCardVC
//            
//            VC.arrMatchInfo = (arrMatchScroll[indexPath.row] as [String : Any])
//
//            VC.match_Id = String(self.arrMatchScroll[indexPath.row]["match_id"] as? Int ?? 0)
//        
//            self.navigationController?.pushViewController(VC, animated: true)
//        }

//    }
    
    
    @IBAction func btnBackClk(_ sender: Any)
    {
        POP_BACK_FROM(self)
    }
    
    @IBAction func btnCartClk(_ sender: Any)
    {
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let VC = storybord.instantiateViewController(withIdentifier: "MyCartVC") as! MyCartVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btnProductDetail(_ sender: UIButton)
    {
        
        if productDetail == 1
        {
            productDetail = 2
            lblProductDetail.isHidden = false
            imgProductDetail.image = (UIImage(named: "minus.png"))
           // btnProductDetail.setImage(UIImage(named: "minus.png"), for: .normal)
        }else
        {
            productDetail = 1
            lblProductDetail.isHidden = true
            imgProductDetail.image = (UIImage(named: "expand.png"))
           // btnProductDetail.setImage(UIImage(named: "expand.png"), for: .normal)
        }
    }
    
    @IBAction func btnUsesClk(_ sender: Any)
    {
        
        if uses == 1
        {
            uses = 2
            lblUses.isHidden = false
            imgUses.image = (UIImage(named: "minus.png"))
           // btnProductDetail.setImage(UIImage(named: "minus.png"), for: .normal)
        }else
        {
            uses = 1
            lblUses.isHidden = true
            imgUses.image = (UIImage(named: "expand.png"))
           // btnProductDetail.setImage(UIImage(named: "expand.png"), for: .normal)
        }
    }
    
    @IBAction func btnWarningPreClk(_ sender: Any)
    {
        if warningPrecautions == 1
        {
            warningPrecautions = 2
            lblWarningPrecaution.isHidden = false
            imgWarnngPrecautions.image = (UIImage(named: "minus.png"))
           // btnProductDetail.setImage(UIImage(named: "minus.png"), for: .normal)
        }else
        {
            warningPrecautions = 1
            lblWarningPrecaution.isHidden = true
            imgWarnngPrecautions.image = (UIImage(named: "expand.png"))
           // btnProductDetail.setImage(UIImage(named: "expand.png"), for: .normal)
        }
    }
    
    @IBAction func btnInteractionClk(_ sender: Any)
    {
        if interactions == 1
        {
            interactions = 2
            lblInteraction.isHidden = false
            imgInteractions.image = (UIImage(named: "minus.png"))
           // btnProductDetail.setImage(UIImage(named: "minus.png"), for: .normal)
        }else
        {
            interactions = 1
            lblInteraction.isHidden = true
            imgInteractions.image = (UIImage(named: "expand.png"))
           // btnProductDetail.setImage(UIImage(named: "expand.png"), for: .normal)
        }
    }
    
    @IBAction func btnDirections(_ sender: Any)
    {
        if directionsForUse == 1
        {
            directionsForUse = 2
            lblDirectionForUse.isHidden = false
            imgDirections.image = (UIImage(named: "minus.png"))
           // btnProductDetail.setImage(UIImage(named: "minus.png"), for: .normal)
        }else
        {
            directionsForUse = 1
            lblDirectionForUse.isHidden = true
            imgDirections.image = (UIImage(named: "expand.png"))
           // btnProductDetail.setImage(UIImage(named: "expand.png"), for: .normal)
        }
    }
    
    @IBAction func btnSideEffects(_ sender: Any)
    {
        if sideEffects == 1
        {
            sideEffects = 2
            lblSideEffect.isHidden = false
            imgSideEffect.image = (UIImage(named: "minus.png"))
           // btnProductDetail.setImage(UIImage(named: "minus.png"), for: .normal)
        }else
        {
            sideEffects = 1
            lblSideEffect.isHidden = true
            imgSideEffect.image = (UIImage(named: "expand.png"))
           // btnProductDetail.setImage(UIImage(named: "expand.png"), for: .normal)
        }
    }
    
    @IBAction func btnMoreInfo(_ sender: Any)
    {
        if moreInfo == 1
        {
            moreInfo = 2
            lblMoreInfo.isHidden = false
            imgMoreInfo.image = (UIImage(named: "minus.png"))
           // btnProductDetail.setImage(UIImage(named: "minus.png"), for: .normal)
        }else
        {
            moreInfo = 1
            lblMoreInfo.isHidden = true
            imgMoreInfo.image = (UIImage(named: "expand.png"))
           // btnProductDetail.setImage(UIImage(named: "expand.png"), for: .normal)
        }
    }
    
}


