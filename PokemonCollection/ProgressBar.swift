//
//  ProgressBar.swift
//  PokemonCollection
//
//  Created by PhongLe on 6/1/17.
//  Copyright © 2017 PhongLe. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable class ProgressBar: UIView {

    @IBInspectable var lineWidth: CGFloat = 2.0
    @IBInspectable var circleColor: UIColor = UIColor.green
    @IBInspectable var fillColor: UIColor = UIColor.clear
    @IBInspectable var progressValue: CGFloat = 0.8 {
        didSet {
            if (progressValue <= 100) && (progressValue >= 0) {
                progressValue = progressValue / 100
            } else if progressValue > 100 {
                progressValue = 1
            } else {
                progressValue = 0
            }
        }
    }
    
    @IBInspectable var sizeLabel: CGFloat = 25
    @IBInspectable var widthLabel: CGFloat = 100
    @IBInspectable var heightLabel: CGFloat = 50
    @IBInspectable var colorLabel: UIColor = UIColor(red: 0.38, green: 0.80, blue: 0.19, alpha: 1)
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //Create UIBezierPath (create template - model for drawing)
        let centerPoint = CGPoint(x: self.bounds.width/2, y: self.bounds.width/2)
        let circleRadius = self.bounds.width/2
        let path = UIBezierPath(arcCenter: centerPoint, radius: circleRadius, startAngle: CGFloat(-0.5 * Double.pi), endAngle: CGFloat(1.5 * Double.pi), clockwise: true)

        //Drawing full progress circle (gray circle)
        var fullProgressCircle = CAShapeLayer()
        fullProgressCircle = CAShapeLayer()
        fullProgressCircle.path = path.cgPath
        fullProgressCircle.strokeColor = UIColor.lightGray.cgColor
        fullProgressCircle.fillColor = UIColor.clear.cgColor
        fullProgressCircle.lineWidth = lineWidth
        fullProgressCircle.strokeStart = 0
        fullProgressCircle.strokeEnd = 1
        self.layer.addSublayer(fullProgressCircle)
        
        //Drawing progress circle (we'll set this color)
        var progressCircle = CAShapeLayer()
        progressCircle = CAShapeLayer()
        progressCircle.path = path.cgPath
        progressCircle.strokeColor = circleColor.cgColor
        progressCircle.fillColor = fillColor.cgColor
        progressCircle.lineWidth = lineWidth
        progressCircle.strokeStart = 0
        progressCircle.strokeEnd = progressValue
        self.layer.addSublayer(progressCircle)
    
        //Adding percent text label
        let progressLabel = UILabel(frame: CGRect(origin: CGPoint(x: self.bounds.size.width/2 - widthLabel/2, y: self.bounds.size.height/2 - heightLabel/2), size: CGSize(width: widthLabel, height: heightLabel)))
        progressLabel.font = UIFont.systemFont(ofSize: sizeLabel, weight: 0.08)
        progressLabel.text = "\(Int(progressValue*100))%"
        progressLabel.textColor = colorLabel
        progressLabel.textAlignment = .center
        self.addSubview(progressLabel)
    }

}
