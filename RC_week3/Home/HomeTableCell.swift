//
//  HomeTableCell.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/04.
//

import UIKit

class HomeTableCell: UITableViewCell {


    @IBOutlet weak var HomeCellimageView: UIImageView!
    @IBOutlet weak var homeCellTitle: UILabel!
    @IBOutlet weak var homeCellLocation: UILabel!
    @IBOutlet weak var homeCellTime: UILabel?
    @IBOutlet weak var homeCellPrice: UILabel!
    
    func priceToString(price: Int) -> String{
        return "\(price)원"
    }
    
//    func configWithItem(item: HomeModelItem){
//        homeCellImageView = UIImageView(image: item.image)
//        homeCellTitle?.text = item.title
//        homeCellLocation?.text = item.location
//        homeCellTime?.text = item.time
//        homeCellPrice?.text = priceToString(price: item.price)
//
//
//
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
