//
//  PokeTableViewController.swift
//  PokemonCollection
//
//  Created by PhongLe on 5/31/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit

enum StretchyMainHeader: CGFloat{
    
     case headerHeight = 170
     case headerCut = 45
    
}

class PokeTableViewController: UITableViewController {

    @IBOutlet var pokeTableView: UITableView!
    
    var pokeListType: [TypePoke]! = TypePoke.getTypePoke()
    
    var mainHeaderView: UIView!
    var newMainHeaderLayer: CAShapeLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Stretchy Header Image
        self.updateMainPokeHeaderView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //turn on transparent for navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        self.pokeTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.pokeTableView.allowsSelection = false
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //turn off transparent for navigation bar
        navigationController?.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listPokeDetail" {
            if let listDetailVC = segue.destination as? ListDetailViewController {
                let dictSender = sender as? [String : AnyObject]
                let arrPokemon = dictSender?["arrPokemon"] as! [Pokemon]
                let indexPokeSelected = dictSender? ["indexPokeSelected"] as! Int
                listDetailVC.arrPokemon = arrPokemon
                listDetailVC.indexPokeSelected = indexPokeSelected
            }
        }
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = Bundle.main.loadNibNamed("PokeHeaderCell", owner: self, options: nil)?.first as! PokeHeaderCell
        headerCell.myTypePoke = pokeListType[section]
        return headerCell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40.0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return pokeListType.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listPokeCell", for: indexPath) as! ListPokeTableCell
        cell.tableCurrentSection = indexPath.section
        cell.pokeItemDelegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
}

extension PokeTableViewController: PokeItemDelegate {
    func didSelectPoke(arrPokemon: [Pokemon], indexPokeSelected: Int) {
        performSegue(withIdentifier: "listPokeDetail", sender: ["arrPokemon" : arrPokemon, "indexPokeSelected" : indexPokeSelected])
    }
}

extension PokeTableViewController {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setNewMainPokeHeaderView()
    }
    
    func updateMainPokeHeaderView(){
        
        pokeTableView.backgroundColor = UIColor.white
        mainHeaderView = pokeTableView.tableHeaderView
        pokeTableView.tableHeaderView = nil
        pokeTableView.rowHeight = UITableViewAutomaticDimension
        pokeTableView.addSubview(mainHeaderView)
        
        newMainHeaderLayer = CAShapeLayer()
        newMainHeaderLayer.fillColor = UIColor.black.cgColor
        mainHeaderView.layer.mask = newMainHeaderLayer
        
        let newHeight = StretchyMainHeader.headerHeight.rawValue - StretchyMainHeader.headerCut.rawValue/2
        pokeTableView.contentInset = UIEdgeInsets(top: newHeight, left: 0, bottom: 0, right: 0)
        pokeTableView.contentOffset = CGPoint(x: 0, y: -newHeight)

    }
    
    func setNewMainPokeHeaderView(){
        
        let newHeight = StretchyMainHeader.headerHeight.rawValue - StretchyMainHeader.headerCut.rawValue/2
        var headerViewFrame =  CGRect(x: 0, y: -newHeight, width: pokeTableView.bounds.width, height: StretchyMainHeader.headerHeight.rawValue)
        
        if pokeTableView.contentOffset.y < newHeight {
            headerViewFrame.origin.y = pokeTableView.contentOffset.y
            headerViewFrame.size.height = -pokeTableView.contentOffset.y + StretchyMainHeader.headerCut.rawValue/2
        }
        
        mainHeaderView.frame = headerViewFrame
        let cutDirection = UIBezierPath()
        cutDirection.move(to: CGPoint(x: 0, y: 0))
        cutDirection.addLine(to: CGPoint(x: headerViewFrame.width, y: 0))
        cutDirection.addLine(to: CGPoint(x: headerViewFrame.width, y: headerViewFrame.height))
        cutDirection.addLine(to: CGPoint(x: 0, y: headerViewFrame.height - StretchyMainHeader.headerCut.rawValue))
        newMainHeaderLayer.path = cutDirection.cgPath
        
    }
}
