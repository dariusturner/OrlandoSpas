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

        // Do any additional setup after loading the view.
    }

    

}
