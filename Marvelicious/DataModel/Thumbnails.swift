//
//  Thumbnails.swift
//  Marvelicious
//
//  Created by Neha Mishra on 18/05/19.
//  Copyright © 2019 Neha Mishra. All rights reserved.
//

import Foundation
import ObjectMapper

struct Thumbnails: Mappable{
    var path: String
    var ext: String
    
    init?(map: Map){
        path = (try? map.value("path")) ?? ""
        ext = (try? map.value("extension")) ?? ""
    }
    
    mutating func mapping(map: Map) {
        path <- map["path"]
        ext <- map["extension"]
    }

    func getUrl() -> String{
        return path + "." + ext
    }
}
