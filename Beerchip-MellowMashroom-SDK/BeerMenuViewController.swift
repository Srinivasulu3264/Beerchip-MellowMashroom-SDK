

import UIKit

protocol beerMenuVCProtocol {
    
    func customPageVCDelegateMethod()
    
}

class BeerMenuViewController: UIViewController {

  
    @IBOutlet weak var beerMenuTable: UITableView!
    
    
    var modelDataArr: [ModelData]? {
        
        didSet {
            DispatchQueue.main.async {
               self.beerMenuTable.reloadData()
             }
        }
    }
    
 var beerMenuVCDelegate : beerMenuVCProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        beerMenuTable.tableFooterView = UIView()
        
           beerMenuTable.rowHeight = UITableViewAutomaticDimension
           beerMenuTable.estimatedRowHeight = 85
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
    
extension BeerMenuViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if modelDataArr?.count == nil{
        return 0
        }
       return  (modelDataArr?.count)!+1
        }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if indexPath.row == 0 {
                let   cell  = tableView.dequeueReusableCell(withIdentifier: "titleCell") as!BeerMenuTitlesTableViewCell
                cell.beerchipsLbl.text = "BEERCHIP"
                cell.abvLabel.text = "ABV"
                cell.titleElementsContainerView.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
                return cell
            }
            else{
                let  cell  = tableView.dequeueReusableCell(withIdentifier: "subTitleCell") as! BeerMenuSubTitlesTableViewCell
  
               cell.abvValueLbl.text = modelDataArr?[indexPath.row-1].abvValue
               cell.beerTitleLable.text = modelDataArr?[indexPath.row-1].titleName
          
                let imgName = modelDataArr![indexPath.row-1].imageName
                cell.beerDisplayImageView.image = UIImage(named: imgName!)
                
                if indexPath.row == 3{
                 cell.beerchipsImageView.image = nil
                }
                
                cell.beerSubTitleLbl.text = "StLouis,MD"
                cell.beerSubTitleLbl.textColor = UIColor.rgb(red: 170, green: 170, blue: 169, alpha: 1.0) 
                cell.noOfStarsRatingImageView.image = UIImage(named: (modelDataArr?[indexPath.row-1].starRating)!)
                return cell
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        beerMenuVCDelegate?.customPageVCDelegateMethod()
        
    }
}

