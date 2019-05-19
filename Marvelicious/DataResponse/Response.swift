//
//  Response.swift
//  Marvelicious
//
//  Created by Neha Mishra on 18/05/19.
//  Copyright © 2019 Neha Mishra. All rights reserved.
//

import Foundation


enum ResponseMarvelInfo{
    case success(model: CharacterInfo)
    case serverError(description: Error)
    case timeOut(desciption: Error)
    case noConnection(description: Error)
}

enum ResponseCharacter{
    case success(model: [Character])
    case serverError(description: Error)
    case timeOut(desciption: Error)
    case noConnection(description: Error)
}
