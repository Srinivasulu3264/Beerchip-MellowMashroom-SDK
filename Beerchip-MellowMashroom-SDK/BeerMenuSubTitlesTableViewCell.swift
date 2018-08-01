//
//  RedeemviewBeerchipTableSubTitlesTableViewCell.swift
//  BeerboardBeerchipFramework
//
//  Created by Vmoksha on 23/02/18.
//  Copyright © 2018 Vmoksha. All rights reserved.
//

import UIKit

class BeerMenuSubTitlesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var beerTitleLable: UILabel!
    
    @IBOutlet weak var beerSubTitleLbl: UILabel!
    
    @IBOutlet weak var abvValueLbl: UILabel!
    
    @IBOutlet weak var beerDisplayImageView: UIImageView!
    
    @IBOutlet weak var beerchipsImageView: UIImageView!
    
    @IBOutlet weak var noOfStarsRatingImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
