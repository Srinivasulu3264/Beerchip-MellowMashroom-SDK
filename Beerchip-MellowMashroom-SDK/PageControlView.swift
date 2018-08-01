//
//  PageControl.swift
//  ContainerVC
//
//  Created by Srinivasulu Budharapu on 11/07/18.
//  Copyright © 2018 Srinivasulu Budharapu. All rights reserved.
//

import UIKit

class PageControlView: UIView {

    @IBOutlet weak var pageControl:UIPageControl!
    
}

extension PageControlView:BeerMenuPageViewControllerDelegate {
    
    func setupPageController(numberOfPages: Int)
    {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int)
    {
        pageControl.currentPage = index
    }
    
}
