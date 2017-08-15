//
//  ListPokeTableCell.swift
//  PokemonCollection
//
//  Created by PhongLe on 5/30/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

protocol PokeItemDelegate {
    func didSelectPoke(arrPokemon: [Pokemon], indexPokeSelected: Int)
}

class ListPokeTableCell: UITableViewCell {

    @IBOutlet weak var pokeCollectionView: UICollectionView!
    
    var dictPoke: [Int: [Pokemon]] = Pokemon.getPokePerType()
    
    var tableCurrentSection: Int!
    
    var pokeItemDelegate: PokeItemDelegate!
    
    //add delegate and datasource in storyboard (click on tableviewcell -> drag new referencing outlet to collectionview -> select datasource (do it again for delegate) )
}

extension ListPokeTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dictPoke[tableCurrentSection]!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokeCell", for: indexPath) as! PokeCollectionCell
        
        cell.myPoke = dictPoke[tableCurrentSection]?[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pokeItemDelegate.didSelectPoke(arrPokemon: dictPoke[tableCurrentSection]!, indexPokeSelected: indexPath.item)
    }
    
    
    //Fix bug repeated cells while scrolling (do the same with tableview if this bug happened - override this func in PoketableViewController)
    override func prepareForReuse() {
        self.pokeCollectionView.reloadData()
    }
    
}
