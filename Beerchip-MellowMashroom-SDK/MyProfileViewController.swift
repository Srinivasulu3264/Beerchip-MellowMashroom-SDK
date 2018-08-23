//
//  MyProfileViewController.swift
//  Beerboard-Beerchip-MellowMushroom-SDK
//
//  Created by Srinivasulu Budharapu on 30/07/18.
//  Copyright © 2018 Srinivasulu Budharapu. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {
    
   var container : ContainerViewController!
    
    @IBOutlet weak var collectionViewContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() , execute: {
            self.setupMenuBar()
        })
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //auto selected 1st item
        menubar.preSelecetingItemAtMenubar()
    }
    
    lazy var menubar:MenuBar = {
        let mb = MenuBar()
        mb.homeVC = self
        return mb
    } ()
    
    private func setupMenuBar() {
        
        collectionViewContainerView.addSubview(menubar)
        collectionViewContainerView.addConstraintsWithFormat(format: "H:|[v0]|", withViews: menubar)
        collectionViewContainerView.addConstraintsWithFormat(format: "V:|[v0]|", withViews:menubar)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containerVCSegue" {
            self.container = segue.destination as! ContainerViewController
        }
    }
    
    
    
    
    
    
    
    
    
    
    

   
}
