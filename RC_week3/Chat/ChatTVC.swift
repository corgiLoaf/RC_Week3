//
//  ChatTVC.swift
//  RC_week3
//
//  Created by 예은 on 2023/01/06.
//

import UIKit

class ChatTVC: UITableViewCell {

    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var itemIMG: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var chatLoc: UILabel!
    @IBOutlet weak var chatDate: UILabel!
    @IBOutlet weak var message: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //circleImage(image: profile)
        // Initialization code
    }

    func circleImage(image: UIImageView){
        image.layer.cornerRadius = image.frame.width / 2
        image.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
