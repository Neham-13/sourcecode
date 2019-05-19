//
//  Character.swift
//  Marvelicious
//
//  Created by Neha Mishra on 18/05/19.
//  Copyright © 2019 Neha Mishra. All rights reserved.
//

import Foundation

import ObjectMapper

struct Character: Mappable{
    var id: Int
    var name: String
    var description: String
    var thumbnail: Thumbnails
    var urls: [ChacterURL]
    
    init?(map: Map){
        id = (try? map.value("id")) ?? 0
        name = (try? map.value("name")) ?? ""
        description = (try? map.value("description")) ?? ""
        thumbnail = (try? map.value("thumbnail")) ?? Thumbnails(map: map)!
        urls = [(try? map.value("urls")) ?? ChacterURL(map: map)!]
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        thumbnail <- map["thumbnail"]
        urls <- map["urls"]
    }
}
