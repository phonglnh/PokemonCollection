//
//  MapCell.swift
//  PokemonCollection
//
//  Created by PhongLe on 6/2/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapCell: UITableViewCell {
    
    @IBOutlet weak var mapView: GMSMapView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Create a GMSCameraPosition with coordinate 10.7716096,106.68087270000001 at zoom level 18
        let camera = GMSCameraPosition.camera(withLatitude: Constant.coordinate["lat"]!, longitude: Constant.coordinate["long"]!, zoom: 16.0)
        //mapView.isMyLocationEnabled = true
        mapView.camera = camera

        mapView.isUserInteractionEnabled = false
        
        //Create a marker   
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: Constant.coordinate["lat"]!, longitude: Constant.coordinate["long"]!)
        marker.title = "FPT IS HCM"
        marker.snippet = "VietNam"
        marker.map = mapView
        //mapView.selectedMarker = marker
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
