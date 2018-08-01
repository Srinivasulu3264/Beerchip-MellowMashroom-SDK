//
//  BeerInfoViewController.swift
//  BeerboardBeerchipFramework
//
//  Created by Vmoksha on 05/03/18.
//

import UIKit

protocol beerInfoVCProtocol {
    func removeBeerinfoVC()
     func displayRedeemBeerchipVC()
}

class BeerInfoViewController: UIViewController {
    
 var beerInfoDelegate : beerInfoVCProtocol?
    
    
    @IBOutlet weak var redeemBeerchipBtn: UIButton!
    
    @IBOutlet weak var rateBeerBtn: UIButton!
    
    
    @IBOutlet weak var addToFavouritesBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redeemBeerchipBtn.layer.cornerRadius = 8.0
        
        redeemBeerchipBtn.backgroundColor = UIColor(red: 255/255, green: 171/255, blue: 21/255, alpha: 1.0)
        
        rateBeerBtn.backgroundColor = UIColor(red: 255/255, green: 171/255, blue: 21/255, alpha: 1.0)
        rateBeerBtn.layer.cornerRadius = rateBeerBtn.frame.size.height/2
        
        addToFavouritesBtn.backgroundColor = UIColor(red: 255/255, green: 171/255, blue: 21/255, alpha: 1.0)
        addToFavouritesBtn.layer.cornerRadius = addToFavouritesBtn.frame.size.height/2
        
        let viewRedeemBtnBorder = CAShapeLayer()
        viewRedeemBtnBorder.strokeColor = UIColor.black.cgColor
        viewRedeemBtnBorder.lineDashPattern = [4, 2]
        viewRedeemBtnBorder.frame = redeemBeerchipBtn.bounds
        viewRedeemBtnBorder.fillColor = nil
        viewRedeemBtnBorder.path = UIBezierPath(roundedRect: redeemBeerchipBtn.bounds, cornerRadius: 8.0).cgPath
        redeemBeerchipBtn.layer.addSublayer(viewRedeemBtnBorder)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func navigationBackBtnAction(_ sender: Any) {
         beerInfoDelegate?.removeBeerinfoVC()
    }
    
    @IBAction func redeemBeerchipBtnAction(_ sender: Any) {
        
         beerInfoDelegate?.displayRedeemBeerchipVC()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
