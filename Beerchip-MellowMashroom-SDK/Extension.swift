//
//  Extension.swift
//  ContainerVCApp
//
//  Created by Srinivasulu Budharapu on 31/07/18.
//  Copyright © 2018 Srinivasulu Budharapu. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
            
        return  UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
            
        }
}
    
    
extension UIView{
        
        func addConstraintsWithFormat(format: String, withViews: UIView...)  {
            var viewsDictionary = [String:UIView]()
            for (index,view) in withViews.enumerated() {
                let key = "v\(index)"
                view.translatesAutoresizingMaskIntoConstraints = false
                viewsDictionary[key] = view    }
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
    

