//
//  DetailCollectionViewCell.swift
//  PokemonCollection
//
//  Created by PhongLe on 6/3/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

enum StretchyItemDetailHeader: CGFloat {
    
    case headerHeight = 200
    case headerCut = 0
    
}

class DetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var detailItemTableView: UITableView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    var pokemon: Pokemon!
    
    var headerView: UIView!
    var newHeaderLayer: CAShapeLayer!
    let detailCellScaling: CGFloat = 0.8
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        detailItemTableView.delegate = self
        detailItemTableView.dataSource = self
        
        detailItemTableView.allowsSelection = false
        
        detailItemTableView.register(UINib(nibName: "HeaderActionCell", bundle: nil), forCellReuseIdentifier: "HeaderActionCell")
        
        detailItemTableView.register(UINib(nibName: "ProgressBarCell", bundle: nil), forCellReuseIdentifier: "ProgressBarCell")
        
        detailItemTableView.register(UINib(nibName: "MapCell", bundle: nil), forCellReuseIdentifier: "MapCell")
        
        detailItemTableView.register(UINib(nibName: "RatingCell", bundle: nil), forCellReuseIdentifier: "RatingCell")
        
        detailItemTableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: "CommentCell")
        
        //Strech Header Image
        updateItemDetailHeaderView()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        self.contentView.backgroundColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
        setCornerRadiusItemDetail()
    }
    
    private func setCornerRadiusItemDetail() {
        
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * detailCellScaling, height: self.containerView.bounds.size.height), byRoundingCorners:[.topLeft, .topRight], cornerRadii: CGSize(width: 20, height:  20))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.containerView.layer.mask = maskLayer
    }
}

extension DetailCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 75.0
        case 1:
            return 140.0
        case 2:
            return 200.0
        case 3:
            return 100.0
        case 4:
            return 300.0
        default:
            return 100.0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 5
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderActionCell", for: indexPath) as! HeaderActionCell
                return cell
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressBarCell", for: indexPath) as! ProgressBarCell
                return cell
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell", for: indexPath) as! MapCell
                return cell
            }
        } else if indexPath.section == 3 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "RatingCell", for: indexPath) as! RatingCell
                return cell
            }
        } else if indexPath.section == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
            return cell
        }
        return UITableViewCell()
    }

}

extension DetailCollectionViewCell {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       setNewItemDetailHeader()
    }

    func updateItemDetailHeaderView(){
        
        detailItemTableView.backgroundColor = UIColor.white
        headerView = detailItemTableView.tableHeaderView
        detailItemTableView.tableHeaderView = nil
        detailItemTableView.rowHeight = UITableViewAutomaticDimension
        detailItemTableView.addSubview(headerView)
        
        newHeaderLayer = CAShapeLayer()
        newHeaderLayer.fillColor = UIColor.black.cgColor
        headerView.layer.mask = newHeaderLayer
        
        let newHeight = StretchyItemDetailHeader.headerHeight.rawValue - StretchyItemDetailHeader.headerCut.rawValue/2
        
        detailItemTableView.contentInset = UIEdgeInsets(top: newHeight, left: 0, bottom: 0, right: 0)
        detailItemTableView.contentOffset = CGPoint(x: 0, y: -newHeight)
        
    }
    
    func setNewItemDetailHeader(){
        
        let newHeight = StretchyItemDetailHeader.headerHeight.rawValue - StretchyItemDetailHeader.headerCut.rawValue/2
        
        var getHeaderFrame =  CGRect(x: 0, y: -newHeight, width: UIScreen.main.bounds.width * detailCellScaling, height: StretchyItemDetailHeader.headerHeight.rawValue)
        
        if detailItemTableView.contentOffset.y < newHeight {
            getHeaderFrame.origin.y = detailItemTableView.contentOffset.y
            getHeaderFrame.size.height = -detailItemTableView.contentOffset.y + StretchyItemDetailHeader.headerCut.rawValue/2

        }
        
        headerView.frame = getHeaderFrame
   
        let cutDirection = UIBezierPath()
        cutDirection.move(to: CGPoint(x: 0, y: 0))
        cutDirection.addLine(to: CGPoint(x: getHeaderFrame.width, y: 0))
        cutDirection.addLine(to: CGPoint(x: getHeaderFrame.width, y: getHeaderFrame.height))
        cutDirection.addLine(to: CGPoint(x: 0, y: getHeaderFrame.height - StretchyItemDetailHeader.headerCut.rawValue
))
        newHeaderLayer.path = cutDirection.cgPath
        
    }
    
}
