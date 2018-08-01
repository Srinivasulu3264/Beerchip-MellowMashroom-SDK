

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var redeemButtomConatinerView: UIView!
    
    
    @IBOutlet weak var welcomeSundarLbl: UILabel!
    
    
    @IBOutlet weak var currentBalancedisplayLbl: UILabel!
    
    @IBOutlet weak var redeemButton: UIButton!
    
    @IBOutlet weak var beerMenuBtn: UIButton!
    
    @IBOutlet weak var myProfileBtn: UIButton!
    
    
    @IBOutlet weak var locationIndicatorBtn: UIButton!
    
    @IBOutlet weak var pageVCcontainerView: UIView!
    
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var myBalanceDisplayLbl: UILabel!
    
    @IBOutlet weak var cashoutBtn: UIButton!
    
    @IBOutlet weak var cashoutBtnView: UIView!
    
     @IBOutlet weak var locationtableConatinerView: UIView!
    
     @IBOutlet weak var locationTableView: UITableView!
    
    @IBOutlet weak var alphaView: UIView!
    
    @IBOutlet weak var externalCashoutBtnContainerView: UIView!
    
    @IBOutlet weak var externalCashoutBtn: UIButton!
    
    @IBOutlet weak var viewUnderBeerMenuBtn: UIView!
    
    @IBOutlet weak var viewUnderMyProfileBtn: UIView!
    
    

    var locationArr = [String]()
    var locationAddressArr = [String]()
  

    var cashOutVC = UIViewController()
    var redeemBeerchipVC = RedeemBeerchipViewController()
    var beerInfoVC = BeerInfoViewController()
    var myProfileVC = MyProfileViewController()
    
    var isTableClicked = false
    
    var isMyProfileVCAdding = false
    var isMyProfileVCRemoving = false
    
    var isCashoutVCAdding = false
    var isCashoutVCRemoving = false
    
    var isRedeemBeerchipVCAdding = false
    var isRedeemBeerchipVCRemoving = false
    
    var isBeerinfoVCAdding = false
    var isBeerinfoVCRemoving = false
    
    var isRedeemBeerchipLocation = false
    var usedefaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        redeemButtomConatinerView.backgroundColor = UIColor.rgb(red: 247, green: 242, blue: 237, alpha: 1.0)
        bottomView.backgroundColor =  UIColor.rgb(red: 255, green: 158, blue: 22, alpha: 1.0)
        cashoutBtn.layer.cornerRadius = 8.0
        redeemButton.layer.cornerRadius = 8.0
        locationIndicatorBtn.layer.cornerRadius = locationIndicatorBtn.frame.size.height/2
        locationIndicatorBtn.backgroundColor = UIColor.rgb(red: 255, green: 171, blue: 21, alpha: 1.0)
        welcomeSundarLbl.textColor =  UIColor.rgb(red: 255, green: 158, blue: 22, alpha: 1.0)
        currentBalancedisplayLbl.textColor =  UIColor.rgb(red: 255, green: 158, blue: 22, alpha: 1.0)
        
      
        
        let beerchipStoryboard = UIStoryboard(name: "BeerchipStoryboard", bundle: Bundle(for: BeerchipViewController.self))
  
        cashOutVC =  beerchipStoryboard.instantiateViewController(withIdentifier: "CashOutViewController") as! CashOutViewController
        redeemBeerchipVC =  beerchipStoryboard.instantiateViewController(withIdentifier: "RedeemBeerchipViewController") as! RedeemBeerchipViewController
        beerInfoVC =  beerchipStoryboard.instantiateViewController(withIdentifier: "BeerInfoViewController") as! BeerInfoViewController
        myProfileVC = beerchipStoryboard.instantiateViewController(withIdentifier: "MyProfileViewController") as! MyProfileViewController
        
        beerInfoVC.beerInfoDelegate = self
  
        redeemBeerchipVC.redeemBeerchipVCDelegate = self
        
//        cashoutBtnView.backgroundColor = UIColor.clear
          cashoutBtnView.isHidden = true
        
        viewUnderBeerMenuBtn.backgroundColor = UIColor.rgb(red: 255, green: 158, blue: 22, alpha: 1.0)
        viewUnderMyProfileBtn.backgroundColor = UIColor.rgb(red: 233, green: 217, blue: 211, alpha: 1.0)
     
        locationArr = ["DECATUR","MIDTOWN","BUCKHEARD","VINIGS","NORTHLAKE","TOMS RIVER, NJ","BROOKHAVEN","MANHATHAN,NY","DONWOODY","EAGLES LANDING","KENNESHAW","HIRAM"]
        
        locationAddressArr = ["155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001","155 W ,33rd street ,New York, NY 10001",]
        
        alphaView.isHidden = true
        locationtableConatinerView.isHidden = true
        externalCashoutBtnContainerView.isHidden = true
        
        externalCashoutBtnContainerView.backgroundColor = UIColor.rgb(red: 255, green: 171, blue: 21, alpha: 1.0)
        
        let index = NSIndexPath(row: 5, section: 0)
        self.locationTableView.selectRow(at: index as IndexPath, animated: true, scrollPosition: UITableViewScrollPosition.middle)
        
        setDottedBorderForButton(buttonName: redeemButton)
        setDottedBorderForButton(buttonName: cashoutBtn)
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CustomPageViewControllerSegue" {
            if let customPageVC = segue.destination as?  CustomPageViewController{
                customPageVC.pageViewControllerDelegate = pageVCcontainerView as? BeerMenuPageViewControllerDelegate
                 customPageVC.customPageVCDelegate = self
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var userdefaultsLocation = UserDefaults.standard.string(forKey: "location")
        
        if userdefaultsLocation == nil {
            userdefaultsLocation = "TOMS RIVER, NJ"
        }
        
        locationIndicatorBtn.setTitle(userdefaultsLocation, for: .normal)
    }
    
    
    func setDottedBorderForButton(buttonName:UIButton)  {
        
        buttonName.backgroundColor = UIColor.rgb(red: 255, green: 171, blue: 21, alpha: 1.0)
        let buttonBorder = CAShapeLayer()
        buttonBorder.strokeColor = UIColor.black.cgColor
        buttonBorder.lineDashPattern = [4, 2]
        buttonBorder.frame = buttonName.bounds
        buttonBorder.fillColor = nil
        buttonBorder.path = UIBezierPath(roundedRect: buttonName.bounds, cornerRadius: 8.0).cgPath
        buttonName.layer.addSublayer(buttonBorder)
    }
    
    
    @IBAction func cashoutBnAction(_ sender: Any) {
        
        externalCashoutBtnContainerView.isHidden = false
        isMyProfileVCRemoving = true
        myProfileVCAddingAndRemoving()
        isCashoutVCAdding = true
        cashoutVCAddingAndRemoving()
        externalCashoutBtn.setTitle("CASH OUT", for: .normal)
    }
    
    @IBAction func locationIndicatorBtnAction(_ sender: Any) {
        alphaView.isHidden = false
        locationtableConatinerView.isHidden = false
    }
    
    
    @IBAction func myProfileBtnAction(_ sender: Any) {
        
        viewUnderBeerMenuBtn.backgroundColor = UIColor.rgb(red: 233, green: 217, blue: 211, alpha: 1.0)
        viewUnderMyProfileBtn.backgroundColor = UIColor.rgb(red: 255, green: 158, blue: 22, alpha: 1.0)

        currentBalancedisplayLbl.text = "$19.00"
        myBalanceDisplayLbl.text = "$19.00"
    //    cashoutBtnView.isHidden = true
        
        isMyProfileVCAdding = true
        myProfileVCAddingAndRemoving()
        
        isBeerinfoVCRemoving = true
        beerInfoVCAddingAndRemoving()
    }
    
    
    
    @IBAction func beerMenuBtnAction(_ sender: Any) {
        
        viewUnderBeerMenuBtn.backgroundColor = UIColor.rgb(red: 255, green: 158, blue: 22, alpha: 1.0)
        viewUnderMyProfileBtn.backgroundColor = UIColor.rgb(red: 233, green: 217, blue: 211, alpha: 1.0)
        
        currentBalancedisplayLbl.text = "$19.00"
        myBalanceDisplayLbl.text = "$19.00"
    //   cashoutBtnView.isHidden = false
    //    cashoutBtnView.backgroundColor = UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
        isMyProfileVCRemoving = true
        myProfileVCAddingAndRemoving()
        
    }

    @IBAction func redeemBtnAction(_ sender: Any) {
        
        if redeemButton.currentTitle == "REDEEM"
        {
            isMyProfileVCRemoving = true
            myProfileVCAddingAndRemoving()
            
            isRedeemBeerchipVCAdding = true
            redeemBeerchipVCAddingAndRemoving()
            
            isCashoutVCRemoving = true
            cashoutVCAddingAndRemoving()
            
            externalCashoutBtnContainerView.isHidden = false
            externalCashoutBtn.setTitle("REDEEM", for: .normal)
   
            redeemButton.setTitle("CASH OUT", for: .normal)
            currentBalancedisplayLbl.text = "$19.00"
        }
        else{
            
            redeemButton.setTitle("REDEEM", for: .normal)
            externalCashoutBtn.setTitle("CASH OUT", for: .normal)
            
            externalCashoutBtnContainerView.isHidden = false
            
            isRedeemBeerchipVCRemoving = true
            redeemBeerchipVCAddingAndRemoving()
            
            isCashoutVCAdding = true
            cashoutVCAddingAndRemoving()
        }
    }

    @IBAction func externalCashoutBtnAction(_ sender: Any) {
        
        
        if externalCashoutBtn.currentTitle == "REDEEM"
        {
            
            isRedeemBeerchipVCRemoving = true
            redeemBeerchipVCAddingAndRemoving()
            
            isMyProfileVCAdding = true
            myProfileVCAddingAndRemoving()
            
            externalCashoutBtnContainerView.isHidden = true
            redeemButton.setTitle("REDEEM", for: .normal)

            currentBalancedisplayLbl.text = "$19.00"
            
            viewUnderBeerMenuBtn.backgroundColor = UIColor.rgb(red: 233, green: 217, blue: 211, alpha: 1.0)
            viewUnderMyProfileBtn.backgroundColor = UIColor.rgb(red: 255, green: 158, blue: 22, alpha: 1.0)
          
            myBalanceDisplayLbl.text = "$19.00"
            
        //    cashoutBtnView.isHidden = true
         
        }else{
            
            isCashoutVCRemoving = true
            cashoutVCAddingAndRemoving()
            
            viewUnderBeerMenuBtn.backgroundColor = UIColor.rgb(red: 255, green: 158, blue: 22, alpha: 1.0)
            viewUnderMyProfileBtn.backgroundColor = UIColor.rgb(red: 233, green: 217, blue: 211, alpha: 1.0)
            
            currentBalancedisplayLbl.text = "$19.00"
            myBalanceDisplayLbl.text = "$19.00"
            
            externalCashoutBtnContainerView.isHidden = true
         //   cashoutBtnView.isHidden = false
        }
        
        if isTableClicked {
            isBeerinfoVCRemoving = true
            beerInfoVCAddingAndRemoving()
            isTableClicked = false
        }
    }
    
    
    func myProfileVCAddingAndRemoving()  {
        
        if isMyProfileVCAdding {
            self.addChildViewController(myProfileVC)
            myProfileVC.view.frame = CGRect(x: 0, y: 162, width:  UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height-242))
            self.view.addSubview(myProfileVC.view)
            myProfileVC.didMove(toParentViewController: self)
            isMyProfileVCAdding = false
        }
        
        if isMyProfileVCRemoving{
            
            myProfileVC.willMove(toParentViewController: nil)
            myProfileVC.view.removeFromSuperview()
            myProfileVC.removeFromParentViewController()
            isMyProfileVCRemoving = false
        }
    }
    
    func cashoutVCAddingAndRemoving()  {
        
        if isCashoutVCAdding {
            self.addChildViewController(cashOutVC)
            cashOutVC.view.frame = CGRect(x: 0, y: 120, width:  UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height-180))
            self.view.addSubview(cashOutVC.view)
            cashOutVC.didMove(toParentViewController: self)
            isCashoutVCAdding = false
        }
        if isCashoutVCRemoving{
            cashOutVC.willMove(toParentViewController: nil)
            cashOutVC.view.removeFromSuperview()
            cashOutVC.removeFromParentViewController()
            isCashoutVCRemoving = false
        }
    }
        
    func redeemBeerchipVCAddingAndRemoving()  {
        
        if isRedeemBeerchipVCAdding {
            self.addChildViewController(redeemBeerchipVC)
            redeemBeerchipVC.view.frame = CGRect(x: 0, y: 120, width: UIScreen.main.bounds.width, height:  (UIScreen.main.bounds.height-180))
            self.view.addSubview(redeemBeerchipVC.view)
            redeemBeerchipVC.didMove(toParentViewController: self)
            isRedeemBeerchipVCAdding = false
        }
        if isRedeemBeerchipVCRemoving{
            redeemBeerchipVC.willMove(toParentViewController: nil)
            redeemBeerchipVC.view.removeFromSuperview()
            redeemBeerchipVC.removeFromParentViewController()
            isRedeemBeerchipVCRemoving = false
        }
    }
    
    func beerInfoVCAddingAndRemoving()  {
        
        if isBeerinfoVCAdding {
            self.addChildViewController(beerInfoVC)
           beerInfoVC.view.frame = CGRect(x: 0, y: 177, width:  UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height-257))
            self.view.addSubview(beerInfoVC.view)
            beerInfoVC.didMove(toParentViewController: self)
            isBeerinfoVCAdding = false
        }
        if isBeerinfoVCRemoving{
            beerInfoVC.willMove(toParentViewController: nil)
            beerInfoVC.view.removeFromSuperview()
            beerInfoVC.removeFromParentViewController()
            isBeerinfoVCRemoving = false
        }
    }
}


extension WelcomeViewController:customPageVCProtocol {
    
    func displayBeerInfoVC() {
        isBeerinfoVCAdding = true
        beerInfoVCAddingAndRemoving()
        isTableClicked = true
    }
}

extension WelcomeViewController:beerInfoVCProtocol{
    func displayRedeemBeerchipVC() {
        isBeerinfoVCRemoving = true
        beerInfoVCAddingAndRemoving()
        redeemBtnAction(self)
    }
    
    func removeBeerinfoVC() {
        print("beerinfo Backbtn Called")
        isBeerinfoVCRemoving = true
        beerInfoVCAddingAndRemoving()
    }
}

//extension WelcomeViewController:beerchipTableVCProtocol{
//    func addBeerinfoVCFromBeerchipTableVC() {
//        print(" beerchipTableVC  table clicked")
//        isBeerinfoVCAdding = true
//        beerInfoVCAddingAndRemoving()
//        setBeerMenubtnSelected()
//        isTableClicked = true
//    }
//
//    func setBeerMenubtnSelected()  {
//        viewUnderBeerMenuBtn.backgroundColor = UIColor(red: 255/255, green: 158/255, blue: 22/255, alpha: 1.0)
//        viewUnderMyProfileBtn.backgroundColor = .white
//        currentBalancedisplayLbl.text = "$19.00"
//        myBalanceDisplayLbl.text = "$19.00"
//    //   cashoutBtnView.isHidden = false
//    //   cashoutBtnView.backgroundColor = UIColor.init(red: 59.0/255.0, green: 26.0/255.0, blue: 14.0/255.0, alpha: 1.0)
//        isBeerchipTableVCRemoving = true
//        myProfileVCAddingAndRemoving()
//    }
//}

extension WelcomeViewController:redeemBeerchipVCProtocol{
    
    func displayLocationTable() {
        print( " location tablecalled ")
        alphaView.isHidden = false
        locationtableConatinerView.isHidden = false
        isRedeemBeerchipVCRemoving = true
        redeemBeerchipVCAddingAndRemoving()
        externalCashoutBtnContainerView.isHidden = true
        isCashoutVCRemoving = true
        cashoutVCAddingAndRemoving()
        isMyProfileVCRemoving = true
        myProfileVCAddingAndRemoving()
        isBeerinfoVCRemoving = true
        beerInfoVCAddingAndRemoving()
        isRedeemBeerchipLocation = true
    }
}



extension WelcomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return locationArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let   cell  = tableView.dequeueReusableCell(withIdentifier: "locationCell") as!LocationTableViewCell
        cell.locationNameLbl.text = locationArr[indexPath.row]
        cell.locationAddessLbl.text = locationAddressArr[indexPath.row]
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.rgb(red: 255, green: 158, blue: 22, alpha: 1.0)
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let locationName = locationArr[indexPath.row]
        locationIndicatorBtn.setTitle(locationName, for: .normal)
        alphaView.isHidden = true
        locationtableConatinerView.isHidden = true
        
        usedefaults.set(locationName, forKey: "location")
        
        if isRedeemBeerchipLocation{
            UserDefaults.standard.set(locationName, forKey: "location")
            redeemButton.setTitle("REDEEM", for: .normal)
            redeemBtnAction(self)
        }
    }
}

