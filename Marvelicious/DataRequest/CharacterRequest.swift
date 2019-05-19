//
//  CharacterRequest.swift
//  Marvelicious
//
//  Created by Neha Mishra on 18/05/19.
//  Copyright © 2019 Neha Mishra. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class RequestCharacter: Request{

    func loadCharacters(name: String?, page: Int = 0, onComplete: @escaping (_ response: ResponseMarvelInfo) -> Void){
        let offset = page * BaseURL.limit
        var queryParams: [String:String] = ["offset": String(offset), "limit": String(BaseURL.limit)]
        if let name = name, !name.isEmpty{
            queryParams["nameStartsWith"] = name.replacingOccurrences(of: " ", with: "")
        }
        let url = BaseURL.basePath + BaseURL.pathCharacters + queryParams.queryString! + BaseURL.getCredentials()
        Alamofire.request(url).responseJSON { (response) in
            let statusCode = response.response?.statusCode
            switch response.result{
            case .success(let value):
                let resultValue = value as? [String: Any]
                if statusCode == 200{
                    let model = Mapper<CharacterInfo>().map(JSONObject:resultValue)
                    onComplete(.success(model: model!))
                }
            case .failure(let error):
                let errorCode = error._code
                if errorCode == -1009 {
                    let erro = Error(msgError: error.localizedDescription, statusCode: errorCode)
                    onComplete(.noConnection(description: erro))
                } else if errorCode == -1001 {
                    let erro = Error(msgError: error.localizedDescription, statusCode: errorCode)
                    onComplete(.timeOut(desciption: erro))
                }
            }
        }
    }
}
