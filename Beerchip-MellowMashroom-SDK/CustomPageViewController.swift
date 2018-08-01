//
//  CustomPageViewController.swift
//  ContainerVC
//
//  Created by Srinivasulu Budharapu on 11/07/18.
//  Copyright © 2018 Srinivasulu Budharapu. All rights reserved.
//

import UIKit


protocol BeerMenuPageViewControllerDelegate: class
{
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

protocol customPageVCProtocol {
    
    func displayBeerInfoVC()
}

class CustomPageViewController: UIPageViewController {

   var customPageVCDelegate : customPageVCProtocol?
    
    var apiDataArr = [ModelData]()


    var modelDataArrsConatinerArr  = [[Any]]()
    var modelDataArrsConatinerArrOptional : [[Any]]?

    var modelDataArr  = [ModelData]()
 
    
      weak var pageViewControllerDelegate: BeerMenuPageViewControllerDelegate?
    
    struct Storyboard {
        static let beerMenuViewController = "BeerMenuViewController"
    }
    
    lazy var viewcontrollerList: [UIViewController] = {
        
        let beerchipStoryboard = UIStoryboard(name: "BeerchipStoryboard", bundle: Bundle(for: BeerMenuViewController.self))
        
        //   let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controllers = [BeerMenuViewController]()
        if let modelDataArrConatinerArr = self.modelDataArrsConatinerArrOptional {
            
            for modelDataArr in modelDataArrConatinerArr {
                let beerMenuVC = beerchipStoryboard.instantiateViewController(withIdentifier: Storyboard.beerMenuViewController) as! BeerMenuViewController
                beerMenuVC.beerMenuVCDelegate = self
                controllers.append(beerMenuVC)
            }
        }
        print(controllers.count)
        self.pageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        return controllers
    }()
    
  override func viewDidLoad() {
        super.viewDidLoad()
  
        dataSource = self
        delegate = self
       setModalDataFromHardCode()
       dataRetriving()
       self.turnToPage(index: 0)
    }
    
    func setModalDataFromHardCode()  {
        
        let data1 = ModelData()
        data1.titleName = "BUD LIGHT"
        data1.imageName = "beer-logo-bud-light"
        data1.abvValue = "4.2%"
        data1.starRating = "5star-rating"
        apiDataArr.append(data1)
        
        let data2 = ModelData()
        data2.titleName = "BUD LIGHT LIME"
        data2.imageName = "beer-logo-bud-light-lime"
        data2.abvValue = "4.2%"
        data2.starRating = "4star-rating"
        apiDataArr.append(data2)
        
        let data3 = ModelData()
        data3.titleName = "BUDWISER"
        data3.imageName = "beer-logo-budweiser"
        data3.abvValue = "5%"
        data3.starRating = "3star-rating"
        apiDataArr.append(data3)
        
        let data4 = ModelData()
        data4.titleName = "COORS BANQUET BEER"
        data4.imageName = "coors"
        data4.abvValue = "4.2%"
        data4.starRating = "2star-rating"
        apiDataArr.append(data4)
        
        let data5 = ModelData()
        data5.titleName = "BUDWISER"
        data5.imageName = "beer-logo-budweiser"
        data5.abvValue = "4.2%"
        data5.starRating = "3star-rating"
        apiDataArr.append(data5)
        
      
        let data6 = ModelData()
        data6.titleName = "BUD LIGHT"
        data6.imageName = "beer-logo-bud-light"
        data6.abvValue = "4.2%"
        data6.starRating = "3star-rating"
        apiDataArr.append(data6)
        
        let data7 = ModelData()
        data7.titleName = "BUDWISER"
        data7.imageName = "beer-logo-budweiser"
        data7.abvValue = "5%"
        data7.starRating = "4star-rating"
        apiDataArr.append(data7)
        
        let data8 = ModelData()
        data8.titleName = "BUD LIGHT LIME"
        data8.imageName = "beer-logo-bud-light-lime"
        data8.abvValue = "4.2%"
        data8.starRating = "3star-rating"
        apiDataArr.append(data8)
        
        let data9 = ModelData()
        data9.titleName = "BUDWISER"
        data9.imageName = "beer-logo-budweiser"
        data9.abvValue = "5%"
        data9.starRating = "2star-rating"
        apiDataArr.append(data9)
        
        let data10 = ModelData()
        data10.titleName = "BUD LIGHT"
        data10.imageName = "beer-logo-bud-light"
        data10.abvValue = "4.2%"
        data10.starRating = "5star-rating"
        apiDataArr.append(data10)
        
        let data11 = ModelData()
        data11.titleName = "COORS BANQUET BEER"
        data11.imageName = "coors"
        data11.abvValue = "4.2%"
        data11.starRating = "2star-rating"
        apiDataArr.append(data11)
        
        let data12 = ModelData()
        data12.titleName = "BUDWISER"
        data12.imageName = "beer-logo-budweiser"
        data12.abvValue = "5%"
        data12.starRating = "4star-rating"
        apiDataArr.append(data12)
        
        let data13 = ModelData()
        data13.titleName = "COORS BANQUET BEER"
        data13.imageName = "coors"
        data13.abvValue = "5%"
        data13.starRating = "5star-rating"
        apiDataArr.append(data13)
      
    }
    
    func dataRetriving(){
        let t = apiDataArr.count
        let n = t/5
        /*   n = t/x
         here, n = no of items to display in table
         t = total no of items from api
         x = no of screens to display data
         */
        
        /* use this code to round 2.2 ,...2.6,... to round num 3 */
       /* let f: Float = 2.0
        let j = Int(f.rounded(.up)) // 3
        print( "My value is \(j)" )
        */
         var i = 0
        for (index,modelItem) in apiDataArr.enumerated() {
            let startIndex = (n+1)*i ;
            var endIndex =   startIndex+n
            print("startIndex: \(startIndex), index : \(index), endIndex : \(endIndex)")
            if ( startIndex <= index)  && ( index <= endIndex ){
          
                modelDataArr.append(modelItem)
             
            }
            if t < endIndex {
                endIndex = t-1
                print("endIndex : \(endIndex)")
            }
            
            if (index == endIndex) {
                modelDataArrsConatinerArr.append(modelDataArr)
                i = i+1
                // modelDataArr.removeAll()
                modelDataArr = [ModelData]()
            }
        }
 
        modelDataArrsConatinerArrOptional = modelDataArrsConatinerArr
    }
    
    func turnToPage(index: Int)
    {
        let controller = viewcontrollerList[index]
        var direction = UIPageViewControllerNavigationDirection.forward
        if let currentVC = viewControllers?.first {
            let currentIndex = viewcontrollerList.index(of: currentVC)!
            if currentIndex > index {
                direction = .reverse
            }
        }
        self.configureDisplaying(viewController: controller)
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
    }
    
    func configureDisplaying(viewController: UIViewController)
    {
        
        for (index, vc) in viewcontrollerList.enumerated() {
            if viewController === vc {
                if let redeemVC = viewController as? BeerMenuViewController {
                    print(index)
                    let modelDataArrsConatinerArr = modelDataArrsConatinerArrOptional![index]
                    redeemVC.modelDataArr = modelDataArrsConatinerArr as? [ModelData]
                     self.pageViewControllerDelegate?.turnPageController(to: index)
                  }
            }
        }
    }
}


extension CustomPageViewController:UIPageViewControllerDataSource   {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = viewcontrollerList.index(of: viewController) else {
            return nil
        }
        let  previousIndex = currentIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        guard previousIndex < viewcontrollerList.count else {
            return nil
        }
        return viewcontrollerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewcontrollerList.index(of: viewController) else {
            return nil
        }
        let  nextIndex = currentIndex + 1
        guard nextIndex != viewcontrollerList.count else {
            return nil
        }
        guard nextIndex < viewcontrollerList.count else {
            return nil
        }
        return viewcontrollerList[nextIndex]
    }
}

extension CustomPageViewController:UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController])
    {
        
        self.configureDisplaying(viewController: pendingViewControllers.first as! BeerMenuViewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        
        
        if !completed {
            self.configureDisplaying(viewController: previousViewControllers.first as! BeerMenuViewController)
        }
    }
}

extension CustomPageViewController:beerMenuVCProtocol{
    
    func customPageVCDelegateMethod() {
        customPageVCDelegate?.displayBeerInfoVC()
    }
    
}
