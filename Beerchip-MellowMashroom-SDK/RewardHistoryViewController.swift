//
//  RewardHistoryViewController.swift
//  Beerchip-MellowMushroom-Plugin
//
//  Created by Srinivasulu Budharapu on 31/07/18.
//  Copyright © 2018 Srinivasulu Budharapu. All rights reserved.
//

import UIKit

class RewardHistoryViewController: UIViewController {

    @IBOutlet var rewardHistoryTable: UITableView!
    
    var datesArr =  [String]()
    var titlesArr  = [String]()
  var costArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rewardHistoryTable.tableFooterView = UIView()
        rewardHistoryTable.rowHeight = UITableViewAutomaticDimension
        rewardHistoryTable.estimatedRowHeight = 120
        
        datesArr = ["June 08,2018","June 02,2018","May 26,2018","May 22,2018"]
        titlesArr = ["TOMS RIVER ,NJ","ROCK VILLE,MD","TOMS RIVER ,NJ","ADAMS MORGAN,DC"]
        costArr = ["$2.00","$1.60","$1.80","$2.04"]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RewardHistoryViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return datesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let   cell  = tableView.dequeueReusableCell(withIdentifier: "rewardHistoryTableCellID") as!
                  RewardHistoryTableViewCell
        
        cell.dateLbl.text = datesArr[indexPath.row]
        cell.dateLbl.textColor = UIColor.rgb(red: 170, green: 170, blue: 169, alpha: 1.0)
        
        cell.titleLbl.text = titlesArr[indexPath.row]
        cell.costLbl.text = costArr[indexPath.row]
        
        cell.subTitleLbl.text = "Budwiser, Bud Light Lime & Bud Light"
        cell.subTitleLbl.textColor = UIColor.rgb(red: 170, green: 170, blue: 169, alpha: 1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
     
        }
}
