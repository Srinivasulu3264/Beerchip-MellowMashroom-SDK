//
//  RewardHistoryTableViewCell.swift
//  Beerchip-MellowMashroom-SDK
//
//  Created by Srinivasulu Budharapu on 01/08/18.
//  Copyright © 2018 Srinivasulu Budharapu. All rights reserved.
//

import UIKit

class RewardHistoryTableViewCell: UITableViewCell {

    
    @IBOutlet var dateLbl: UILabel!
    
    @IBOutlet var titleLbl: UILabel!
    
    @IBOutlet var subTitleLbl: UILabel!
    
    @IBOutlet var costLbl: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
