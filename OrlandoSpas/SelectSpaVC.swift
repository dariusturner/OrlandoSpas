//
//  SelectSpaVC.swift
//  OrlandoSpas
//
//  Created by Darius Turner on 1/14/17.
//  Copyright © 2017 DariusTurner. All rights reserved.
//

import UIKit
import GoogleMobileAds

class SelectSpaVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bannerView: GADBannerView!
    
    var interstitial: GADInterstitial!
    
    var spas = [Spa]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAndLoadInterstitial()
        
        print("Google Mobile Ads SDK version: " + GADRequest.sdkVersion())
        bannerView.adUnitID = "ca-app-pub-8663997758410745/1449565519"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())

        let spa1 = Spa(image: #imageLiteral(resourceName: "MandaraPic"), spaUrl: "http://www.mandaraspa.ca", spaName: "Mandara Spa")
        
        let spa2 = Spa(image: #imageLiteral(resourceName: "MilleniaPic"), spaUrl: "http://millenianailsanddayspa.com", spaName: "Millenia Nails & Day Spa")
        
        let spa3 = Spa(image: #imageLiteral(resourceName: "ThorntonParkPic"), spaUrl: "http://spaorlando.com", spaName: "The Spa at Thornton Park")
        
        let spa4 = Spa(image: #imageLiteral(resourceName: "TheSpaPic"), spaUrl: "https://thespaorlando.com/?utm_source=googlemybusiness&utm_medium=search&utm_content=orlando&utm_campaign=thespalocalsearch", spaName: "The Spa on Edgewater Dr")
        
        let spa5 = Spa(image: #imageLiteral(resourceName: "SanctuaryPic"), spaUrl: "http://www.sanctuarysalondayspa.com", spaName: "Sanctuary Salon & Med Spa")
        
        let spa6 = Spa(image: #imageLiteral(resourceName: "Hand&StonePic"), spaUrl: "http://www.handandstonedowntownorlando.com", spaName: "Hand & Stone Massage and Facial")
        
        let spa7 = Spa(image: #imageLiteral(resourceName: "BellaVitaPic"), spaUrl: "http://bellavitamedispa.com", spaName: "Bella Vita Medi Spa")
        
        let spa8 = Spa(image: #imageLiteral(resourceName: "WoodhouseDayPic"), spaUrl: "https://orlando.woodhousespas.com", spaName: "Woodhouse Day Spa")
        
        let spa9 = Spa(image: #imageLiteral(resourceName: "AvalonPic"), spaUrl: "http://www.avalon-massage.com", spaName: "Avalon Massage & Health Spa")
        
        let spa10 = Spa(image: #imageLiteral(resourceName: "BahamaPic"), spaUrl: "http://bahamanailsspaorlando.com", spaName: "Bahamas Nails Spa Orlando")
        
        let spa11 = Spa(image: #imageLiteral(resourceName: "DEBONAIRPic"), spaUrl: "http://debonairnailsspa.com", spaName: "DEBONAIR NAILS & SPA")
        
        let spa12 = Spa(image: #imageLiteral(resourceName: "AsiaDayPic"), spaUrl: "http://www.acquadayspa.com", spaName: "Aqua Day Spa")
        
        let spa13 = Spa(image: "", spaUrl: "https://parloursalonandspa.com", spaName: "Parlour Salon And Spa")
        
        let spa14 = Spa(image: "", spaUrl: "http://flawlesswaxnspa.com/site/", spaName: "Flawless Wax & Spa")
        
        let spa15 = Spa(image: "", spaUrl: "http://jbaumansalon.com", spaName: "J.  Bauman Salon")
        
        let spa16 = Spa(image: "", spaUrl: "http://www.shalasalon.com", spaName: "Shala Salon & Spa")
        
        let spa17 = Spa(image: "", spaUrl: "https://disneyworld.disney.go.com/spas/saratoga-springs-resort-and-spa/senses-spa-saratoga/", spaName: "Senses - Disney Spa")
        
        let spa18 = Spa(image: "", spaUrl: "http://www.lightrx.com/orlando", spaName: "Light RX Face & Body")
        
        let spa19 = Spa(image: "", spaUrl: "http://www.tsecret.com", spaName: "T Secret")
        
        let spa20 = Spa(image: "", spaUrl: "http://infinitewellnessmedspa.com", spaName: "Infinite Wellness Medspa")
        
        let spa21 = Spa(image: "", spaUrl: "http://www.saltroomorlando.com", spaName: "The Salt Room")
        
        let spa22 = Spa(image: "", spaUrl: "http://lotusblossommassage.com", spaName: "Lotus Blossom Day Spa")
        
        let spa23 = Spa(image: "", spaUrl: "http://www.essentialsmetrowest.com", spaName: "Essentials Spa & Salon")
        
        spas.append(spa1)
        spas.append(spa2)
        spas.append(spa3)
        spas.append(spa4)
        spas.append(spa5)
        spas.append(spa6)
        spas.append(spa7)
        spas.append(spa8)
        spas.append(spa9)
        spas.append(spa10)
        spas.append(spa11)
        spas.append(spa12)
        spas.append(spa13)
        spas.append(spa14)
        spas.append(spa15)
        spas.append(spa16)
        spas.append(spa17)
        spas.append(spa18)
        spas.append(spa19)
        spas.append(spa20)
        spas.append(spa21)
        spas.append(spa22)
        spas.append(spa23)
        
        _ = spas.sort { $0.spaName < $1.spaName }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    fileprivate func createAndLoadInterstitial() {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-8663997758410745/9514655110")
        let request = GADRequest()
        // Request test ads on devices you specify. Your test device ID is printed to the console when
        // an ad request is made.
        request.testDevices = [ kGADSimulatorID ]
        interstitial.load(request)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SpaCell", for: indexPath) as? SpaCell {
            
            let spa = spas[indexPath.row]
            
            cell.updateUI(spa: spa)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spas.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        createAndLoadInterstitial()
        
        let spa = spas[indexPath.row]
        
        performSegue(withIdentifier: "WebSiteVC", sender: spa)
        
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WebSiteVC {
            
            if let selected = sender as? Spa {
                destination.spa = selected
            }
        }
    }

}
