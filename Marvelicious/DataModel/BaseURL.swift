//
//  BaseURL.swift
//  Marvelicious
//
//  Created by Neha Mishra on 18/05/19.
//  Copyright © 2019 Neha Mishra. All rights reserved.
//

import Foundation
import CryptoSwift

class BaseURL{
    static let basePath = "https://gateway.marvel.com/v1/public"
    static let pathCharacters = "/characters?"
    static let limit = 50
    /// - add private key
    static private let privateKey = "40d66f9343d20725ba5d8bc43c747efc258d1489"
    /// - add public key
    static private let publicKey = "e277ffe5bcc95e3e8772ec03e811890e"
    
    
    static func getCredentials() -> String{
        let ts = Date().timeIntervalSince1970.description
        let hash = "\(ts)\(privateKey)\(publicKey)".md5()
        let authParams = ["ts": ts, "apikey": publicKey, "hash": hash]
        return authParams.queryString!
    }
}

