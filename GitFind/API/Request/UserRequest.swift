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
    
    static func getUsers(success: @escaping (_ user: [User]) -> Void, failure: @escaping () -> Void) {
        
        let url = "https://api.github.com/users"
        
        Alamofire.request(url).validate().responseJSON { (json: DataResponse <Any>) in
            if let error = json.error {
                print("Error: " + error.localizedDescription)
            } else if let user = try? JSONDecoder().decode([User].self, from: json.data!) {
                print(user)
                success(user)
            }
        }
    }
}
