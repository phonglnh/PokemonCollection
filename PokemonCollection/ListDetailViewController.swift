//
//  ListDetailViewController.swift
//  PokemonCollection
//
//  Created by PhongLe on 6/3/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {

    @IBOutlet weak var listDetailCollectionView: UICollectionView!
    
    var arrPokemon: [Pokemon]!
    var indexPokeSelected: Int!
    
    let pokeType = {(poke: Pokemon) -> (String) in
        switch poke.type {
        case "F":
            return "🔥"
        case "W":
            return "💦"
        case "T":
            return "🍀"
        case "G":
            return "⛰"
        case "S":
            return "⛅️"
        default:
            return "🌎"
        }
    }
    
    let detailCellScaling: CGFloat = 0.8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * detailCellScaling)
        let cellHeight = screenSize.height
        
        let insetX:CGFloat = (screenSize.width - cellWidth) / 2.0
        let insetTop:CGFloat = 64.0
        let insetBottom:CGFloat = 0
        
        let layout = self.listDetailCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.minimumLineSpacing = 8
        self.listDetailCollectionView.contentInset = UIEdgeInsetsMake(insetTop, insetX, insetBottom, insetX)
       
        listDetailCollectionView.dataSource = self
        listDetailCollectionView.delegate = self
        listDetailCollectionView.allowsSelection = false
        
        let nibDetailItem = UINib(nibName: "DetailCollectionViewCell", bundle: nil)
        listDetailCollectionView.register(nibDetailItem, forCellWithReuseIdentifier: "DetailCollectionViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        let indexPathSelect = IndexPath(item: indexPokeSelected, section: 0)
        listDetailCollectionView.scrollToItem(at: indexPathSelect, at: .centeredHorizontally, animated: false)
        self.listDetailCollectionView.backgroundColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
        
        //remove navigation bar separator bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        //show navigation bar(fix transition smoothy from translucent to opaque)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
       
        //set navigation bar title and color
        self.navigationItem.title = "\(pokeType(arrPokemon[0])) Pokémon"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.26, green: 0.26, blue: 0.26, alpha: 1)
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //hidden navigation bar(fix transition smoothy from translucent to opaque)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension ListDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if arrPokemon.count > 0 {
            return arrPokemon.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath) as! DetailCollectionViewCell
        cell.headerImageView.image = arrPokemon[indexPath.item].image
    
        return cell
    }
}

extension ListDetailViewController: UIScrollViewDelegate {
  
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.listDetailCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}
