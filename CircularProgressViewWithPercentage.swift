//
//  CircularProgressViewWithPercentage.swift
//  Circular_Progressbar
//
//  Created by User on 5/20/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

@IBDesignable class CircularProgressViewWithPercentage: UIView {

    //let center = self.center
    let trackLayer = CAShapeLayer()
    let shapeLayer = CAShapeLayer()
    var circularPath: UIBezierPath!
    var circularPathFix: UIBezierPath!
    var startAngle = -CGFloat.pi/2
    var endAngle = CGFloat.pi*2 - 60
    
    @IBInspectable var radius:CGFloat = 100
  
    @IBInspectable var lineColor: UIColor = UIColor.red
    @IBInspectable var fixLineColor: UIColor = UIColor.black

    @IBInspectable var centerX: CGFloat = 10
    @IBInspectable var centerY: CGFloat = 10
//    @IBInspectable var progressPercentage:CGFloat = 10

    
    //var  = value
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       // fatalError("init(coder:) has not been implemented")
    }
    //     Only override draw() if you perform custom drawing.
//     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
         //Drawing code
        let center = CGPoint(x: centerX, y: centerY)
        
        //Calculate percentage
      //  let endAngleP:CGFloat = CGFloat(360*progressPercentage) / CGFloat(100)
        
         circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
         circularPathFix = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: 360, clockwise: true)
        // Progressive circle color
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = lineColor.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeEnd = 0
        trackLayer.lineCap = CAShapeLayerLineCap.round

        // Fix circle color
        shapeLayer.path = circularPathFix.cgPath
        shapeLayer.strokeColor = fixLineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(trackLayer)
        
       // animation()
    }
    
    
    func animation(){
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 4
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        trackLayer.add(basicAnimation, forKey: "basicAnimation")
    }

}
