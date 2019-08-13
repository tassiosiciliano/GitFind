//
//  UserRequest.swift
//  GitFind
//
//  Created by Tassio Siciliano on 10/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import Foundation
import Alamofire

class UserRequest {
    
    static func getUsers() {
        let url = "https://api.github.com/search/users?q=ios"
        Alamofire.request(url, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                print("... SUCESSO ✅ ...")
                if let userResponse = response.data {
                    guard let users = try? JSONDecoder().decode(User.self, from: userResponse) else {
                        print("Error: Couldn't decode data into User")
                        return
                    }
                    print(users)
                }
            } else {
                print("Erro")
            }
        }
    }
}
