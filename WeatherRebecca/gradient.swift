//
//  gradient.swift
//  WeatherRebecca
//
//  Created by admin on 13/04/2017.
//  Copyright © 2017 iOS Dev. All rights reserved.
//

import UIKit

class gradient: NSObject {
    var view:UIView=UIView()
    var layerName:String="tester"
    
    var topRed:CGFloat=255
    var topGreen:CGFloat=255
    var topBlue:CGFloat=255
    var botRed:CGFloat=255
    var botGreen:CGFloat=255
    var botBlue:CGFloat=255
    
    var gradients:[CAGradientLayer]=[]
    
    init(view:UIView,  layerName:String,topRed:CGFloat, topGreen:CGFloat,topBlue:CGFloat,botRed:CGFloat,botGreen:CGFloat,botBlue:CGFloat)
    
    {
        super.init()
        
        self.topRed=topRed
        self.topGreen=topGreen
        self.topBlue=topBlue
        self.botRed=botRed
        self.botGreen=botGreen
        self.botBlue=botBlue
        
        self.view=view
        self.layerName=layerName
        
        
        applyGradient()
        
        
    }
    
        
        func applyGradient(){
            
            let topColor=UIColor(red: self.topRed/255, green: self.topGreen/255, blue: self.topBlue/255, alpha: 1)
            
            let botColor=UIColor(red: self.botRed/255, green: self.botGreen/255, blue: self.botBlue/255, alpha: 1)
            
            let gradientColors=[topColor.cgColor,botColor.cgColor]
            
            let gradientLocations:[Float]=[0.0,1.0]
            
            let gradientLayer:CAGradientLayer=CAGradientLayer()
            gradientLayer.colors=gradientColors
            gradientLayer.locations=gradientLocations as [NSNumber]?
            gradientLayer.name=layerName
            gradientLayer.frame=self.view.bounds
            gradients.append(gradientLayer)
            self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        }
        

}
