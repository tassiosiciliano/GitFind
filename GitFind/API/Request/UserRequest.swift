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
    
    static func getUsers(success: @escaping (_ user: [User]) -> Void,
                         failure: @escaping () -> Void) {
        
        let url = "https://api.github.com/users"
        
        Alamofire.request(url, method: .get).responseJSON { (responseData: DataResponse <Any>) in
            if let error = responseData.error {
                print("Error: " + error.localizedDescription)
            } else if let user = try? JSONDecoder().decode([User].self, from: responseData.data!) {
                success(user)
            }
        }
    }
}
