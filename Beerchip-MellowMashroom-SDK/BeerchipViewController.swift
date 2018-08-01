

import UIKit

public class BeerchipViewController: UIViewController {

    @IBOutlet weak var viewRedeemBtn: UIButton!
    
    @IBOutlet weak var beerchipLabel: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        viewRedeemBtn.layer.cornerRadius = 8.0
        viewRedeemBtn.backgroundColor = UIColor(red: 255/255, green: 171/255, blue: 21/255, alpha: 1.0)
        beerchipLabel.textColor = UIColor(red: 255/255, green: 158/255, blue: 22/255, alpha: 1.0)
        
        let viewRedeemBtnBorder = CAShapeLayer()
        viewRedeemBtnBorder.strokeColor = UIColor.black.cgColor
        viewRedeemBtnBorder.lineDashPattern = [4, 2]
        viewRedeemBtnBorder.frame = viewRedeemBtn.bounds
        viewRedeemBtnBorder.fillColor = nil
        viewRedeemBtnBorder.path = UIBezierPath(roundedRect: viewRedeemBtn.bounds, cornerRadius: 8.0).cgPath
        viewRedeemBtn.layer.addSublayer(viewRedeemBtnBorder)
        // Do any additional setup after loading the view.
    }

    @IBAction func viewRedeemBtnAction(_ sender: Any) {
        
       performSegue(withIdentifier: "toWelcomeVCSegue", sender: self)
        
    }
    
}
