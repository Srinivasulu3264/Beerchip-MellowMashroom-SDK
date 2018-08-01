//
//  RedeemViewBeerchipTableTitleTableViewCell.swift
//  BeerboardBeerchipFramework
//
//  Created by Vmoksha on 23/02/18.
//  Copyright © 2018 Vmoksha. All rights reserved.
//

import UIKit

class BeerMenuTitlesTableViewCell: UITableViewCell {

    @IBOutlet weak var beerchipsLbl: UILabel!
        
    @IBOutlet weak var abvLabel: UILabel!
    
    @IBOutlet weak var titleElementsContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
