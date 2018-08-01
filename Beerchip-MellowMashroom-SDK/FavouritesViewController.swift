//
//  FavouritesViewController.swift
//  Beerboard-Beerchip-MellowMushroom-SDK
//
//  Created by Srinivasulu Budharapu on 30/07/18.
//  Copyright © 2018 Srinivasulu Budharapu. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController {

    @IBOutlet var favouritesTable: UITableView!
     var titlesArr  = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        favouritesTable.tableFooterView = UIView()
        favouritesTable.rowHeight = UITableViewAutomaticDimension
        favouritesTable.estimatedRowHeight = 80
           titlesArr = ["BUD LIGHT", "BUD LIGHT LIME", "BUDWISER"]
        // Do any additional setup after loading the view.
    }

}

extension FavouritesViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titlesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let   cell  = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableCellID") as!
        FavouritesTableViewCell
        cell.titleLabel.text = titlesArr[indexPath.row]
        cell.subTitleLabel.text = "St Louis MD"
        cell.subTitleLabel.textColor = UIColor.rgb(red: 170, green: 170, blue: 169, alpha: 1.0)
        return cell
    }
    
}
