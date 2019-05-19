//
//  QueryString.swift
//  Marvelicious
//
//  Created by Neha Mishra on 18/05/19.
//  Copyright © 2019 Neha Mishra. All rights reserved.
//

import Foundation

extension Dictionary {
    var queryString: String? {
        return self.reduce("") { "\($0!)\($1.0)=\($1.1)&" }
    }
}
