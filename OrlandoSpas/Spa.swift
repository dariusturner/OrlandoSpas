//
//  spa.swift
//  OrlandoSpas
//
//  Created by Darius Turner on 1/14/17.
//  Copyright © 2017 DariusTurner. All rights reserved.
//

import Foundation

class Spa {
    private var _image: Any!
    private var _spaUrl: String!
    private var _spaName: String!
    
    var image: Any {
        return _image
    }
    
    var spaUrl: String {
        return _spaUrl
    }
    
    var spaName: String {
        return _spaName
    }
    
    init(image: Any, spaUrl: String, spaName: String) {
        _image = image
        _spaUrl = spaUrl
        _spaName = spaName
    }
}
