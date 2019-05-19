//
//  ChacterURL.swift
//  Marvelicious
//
//  Created by Neha Mishra on 18/05/19.
//  Copyright © 2019 Neha Mishra. All rights reserved.
//

import Foundation
import ObjectMapper

struct ChacterURL: Mappable{
    var type: String
    var url: String
    
    init?(map: Map){
        type = (try? map.value("type")) ?? ""
        url = (try? map.value("url")) ?? ""
    }
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        url <- map["url"]
    }
}
