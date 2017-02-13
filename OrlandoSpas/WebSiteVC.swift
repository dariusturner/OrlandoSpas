//
//  WebSiteVC.swift
//  OrlandoSpas
//
//  Created by Darius Turner on 1/14/17.
//  Copyright © 2017 DariusTurner. All rights reserved.
//

import UIKit
import GoogleMobileAds

class WebSiteVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bannerView: GADBannerView!
    var interstitial: GADInterstitial!
    
    private var _spa: Spa!
    
    var spa: Spa {
        get {
            return _spa
        } set {
            _spa = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAndLoadInterstitial()
        
        print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        bannerView.adUnitID = "ca-app-pub-8663997758410745/1449565519"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())

        titleLbl.text = spa.spaName
        webView.loadRequest(NSURLRequest(url: NSURL(string: "\(spa.spaUrl)")! as URL) as URLRequest)
        webView.allowsLinkPreview = true
        
        interstitial.present(fromRootViewController: self)
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    fileprivate func createAndLoadInterstitial() {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-8663997758410745/9514655110")
        let request = GADRequest()
        // Request test ads on devices you specify. Your test device ID is printed to the console when
        // an ad request is made.
        request.testDevices = [ kGADSimulatorID ]
        interstitial.load(request)
    }
    
}
