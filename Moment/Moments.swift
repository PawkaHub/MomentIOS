//
//  Moments.swift
//  
//
//  Created by Pieter Parker on 2015-02-07.
//
//

import UIKit

class Moments:UIViewController {
    override func viewDidLoad() {
        println("MOMENTS VIEW LOADED")
        self.view.backgroundColor = UIColor.blueColor()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
