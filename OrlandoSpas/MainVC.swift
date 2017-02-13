//
//  ViewController.swift
//  OrlandoSpas
//
//  Created by Darius Turner on 1/14/17.
//  Copyright © 2017 DariusTurner. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MainVC: UIViewController {
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        bannerView.adUnitID = "ca-app-pub-8663997758410745/1449565519"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
        
}

