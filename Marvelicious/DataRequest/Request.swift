//
//  Request.swift
//  Marvelicious
//
//  Created by Neha Mishra on 18/05/19.
//  Copyright © 2019 Neha Mishra. All rights reserved.
//

import Foundation
import Alamofire

class Request{
    
    let alamofireManager: SessionManager = {
        let configurarion = URLSessionConfiguration.default
        configurarion.timeoutIntervalForRequest = 10000
        configurarion.timeoutIntervalForResource = 10000
        return SessionManager(configuration: configurarion)
    }()
}
