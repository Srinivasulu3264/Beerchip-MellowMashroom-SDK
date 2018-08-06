

import UIKit

public class BeerchipViewController: UIViewController {

    @IBOutlet weak var viewRedeemBtn: UIButton!
    
    @IBOutlet weak var beerchipLabel: UILabel!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        viewRedeemBtn.layer.cornerRadius = 8.0
        viewRedeemBtn.backgroundColor = UIColor.rgb(red: 255, green: 171, blue: 21, alpha: 1.0)
        beerchipLabel.textColor = UIColor.rgb(red: 255, green: 158, blue: 22, alpha: 1.0) 
        
       
        // Do any additional setup after loading the view.
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let viewRedeemBtnBorder = CAShapeLayer()
        viewRedeemBtnBorder.strokeColor = UIColor.black.cgColor
        viewRedeemBtnBorder.lineDashPattern = [4, 2]
        viewRedeemBtnBorder.frame = viewRedeemBtn.bounds
        viewRedeemBtnBorder.fillColor = nil
        viewRedeemBtnBorder.path = UIBezierPath(roundedRect: viewRedeemBtn.bounds, cornerRadius: 8.0).cgPath
        viewRedeemBtn.layer.addSublayer(viewRedeemBtnBorder)
    }

    @IBAction func viewRedeemBtnAction(_ sender: Any) {
        
       performSegue(withIdentifier: "toWelcomeVCSegue", sender: self)
        
    }
    
}
