//
//  MyRatingsViewController.swift
//  Beerboard-Beerchip-MellowMushroom-SDK
//
//  Created by Srinivasulu Budharapu on 30/07/18.
//  Copyright © 2018 Srinivasulu Budharapu. All rights reserved.
//

import UIKit

class MyRatingsViewController: UIViewController {

    @IBOutlet var myRatingsTable: UITableView!
     var titlesArr  = [String]()
    var ratingImages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myRatingsTable.tableFooterView = UIView()
        myRatingsTable.rowHeight = UITableViewAutomaticDimension
        myRatingsTable.estimatedRowHeight = 80
        
        titlesArr = ["BUD LIGHT", "BUD LIGHT LIME", "BUDWISER"]
        ratingImages = ["5star-rating","4star-rating","4star-rating"]
        // Do any additional setup after loading the view.
    }

}

extension MyRatingsViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titlesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let   cell  = tableView.dequeueReusableCell(withIdentifier: "myRatingsTableCellID") as!
        MyRatingsTableViewCell
        cell.titleLabel.text = titlesArr[indexPath.row]
        cell.subtitleLabel.text = "St Louis MD"
        cell.subtitleLabel.textColor = UIColor.rgb(red: 170, green: 170, blue: 169, alpha: 1.0)
        cell.ratingsImage.image = UIImage(named: ratingImages[indexPath.row])
        
        return cell
    }

}
