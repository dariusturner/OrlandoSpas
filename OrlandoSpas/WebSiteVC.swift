//
//  WebSiteVC.swift
//  OrlandoSpas
//
//  Created by Darius Turner on 1/14/17.
//  Copyright © 2017 DariusTurner. All rights reserved.
//

import UIKit

class WebSiteVC: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var titleLbl: UILabel!
    
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

        titleLbl.text = spa.spaName
        webView.loadRequest(NSURLRequest(url: NSURL(string: "\(spa.spaUrl)")! as URL) as URLRequest)
        webView.allowsLinkPreview = true
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
