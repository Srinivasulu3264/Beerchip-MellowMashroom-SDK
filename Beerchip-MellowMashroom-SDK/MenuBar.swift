//
//  MenuBar.swift
//  ContainerVCApp
//
//  Created by Srinivasulu Budharapu on 31/07/18.
//  Copyright © 2018 Srinivasulu Budharapu. All rights reserved.
//

import UIKit


class MenuBar: UIView,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

     let cellID = "MenubarCell"
    let imagenamesArr = ["rewardHistory","favourites","myRatings"]
    let titleArr = ["Reward History","Favourites","My Ratings"]
    
     var homeVC:MyProfileViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionview)
        addConstraintsWithFormat(format: "H:|[v0]|", withViews: collectionview)
        addConstraintsWithFormat(format: "V:|[v0]|", withViews: collectionview)
        
        collectionview.register(MyProfileCellCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

    lazy var collectionview : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    func preSelecetingItemAtMenubar()  {
        
        let indexPathForFirstRow = IndexPath(row: 0, section: 0)
        collectionview.selectItem(at: indexPathForFirstRow as IndexPath, animated: true, scrollPosition: .top)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =   collectionview.dequeueReusableCell(withReuseIdentifier: cellID , for: indexPath) as! MyProfileCellCollectionViewCell
        
        cell.profileImageview.image = UIImage(named: imagenamesArr[indexPath.row])?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        cell.profileImageview.tintColor = UIColor.black
        cell.titleLabel.text = titleArr[indexPath.row]
        cell.backgroundColor = UIColor.rgb(red: 247, green: 242, blue: 237, alpha: 1.0)
 
        let backgroundView = UIView()
        backgroundView.backgroundColor = .white
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: frame.height)
    }
    
    // dont use minimum line spacing here... use only minimum inter item Spacing only
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if indexPath.item == 0  {
            homeVC?.container.segueIdentifierReceivedFromParent("rewardHistoryVCSegue")
        } else if indexPath.item == 1 {
            homeVC?.container.segueIdentifierReceivedFromParent("favouritesVCSegue")
        } else {
             homeVC?.container.segueIdentifierReceivedFromParent("myRatingsVCSegue")
        }
   }
}

class MyProfileCellCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let profileImageview : UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "shape-9")?.withRenderingMode(UIImageRenderingMode.alwaysTemplate)
      //  imageview.layer.cornerRadius = 22.0
        imageview.contentMode = .scaleToFill
        imageview.layer.masksToBounds = true
        return imageview
    }()
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title- Shivoham Statue"
        label.numberOfLines = 0
        return label
    }()
    
    override var isSelected: Bool {
        didSet{
            profileImageview.tintColor = isSelected ? UIColor.rgb(red: 255, green: 171, blue: 21, alpha: 1) :UIColor.black
            titleLabel.textColor = isSelected ? UIColor.rgb(red: 255, green: 171, blue: 21, alpha: 1) :  UIColor.black
        }
    }
    
    
    func  setupViews(){
        addSubview(profileImageview)
        addSubview(titleLabel)
        
        
        addConstraintsWithFormat(format: "H:[v0(42)]", withViews: profileImageview)
        
        addConstraintsWithFormat(format: "H:[v0]", withViews: titleLabel)
        
        addConstraint(NSLayoutConstraint(item: profileImageview, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: profileImageview, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 36))
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 24))
        
       addConstraintsWithFormat(format: "V:|-8-[v0]-[v1]-|", withViews: profileImageview,titleLabel)
        
        
    }
}

