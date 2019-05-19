//
//  CharacterInfo.swift
//  Marvelicious
//
//  Created by Neha Mishra on 18/05/19.
//  Copyright © 2019 Neha Mishra. All rights reserved.
//

import Foundation
import ObjectMapper

struct CharacterInfo: Mappable{
    var code: Int
    var status: String
    var data: CharacterData
    
    init?(map: Map) {
        code = (try? map.value("code")) ?? 0
        status = (try? map.value("status")) ?? ""
        data = (try? map.value("data")) ?? CharacterData(map: map)!
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        status <- map["status"]
        data <- map["data"]
    }
}
