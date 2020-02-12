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
    
    // MARK: - Get Users List
    static func getUsers(success: @escaping (_ user: [Users]) -> Void,
                         failure: @escaping () -> Void) {
        
        let url = "https://api.github.com/users"
        
        Alamofire.request(url, method: .get).responseJSON { (responseData: DataResponse <Any>) in
            if let error = responseData.error {
                print("Error: " + error.localizedDescription)
            } else if let data = responseData.data {
                if let user = try? JSONDecoder().decode([Users].self, from: data) {
                    success(user)
                }
            }
        }
    }
    
    // MARK: - Get User by Login
    static func getUserByLogin(login: String?,
                               success: @escaping (_ user: Users) -> Void,
                               failure: @escaping () -> Void) {
        
        if let userLogin = login {
//            let url = "https://api.github.com/search/users?q=\(userLogin)"
            let url = "https://api.github.com/users/\(userLogin)"
            Alamofire.request(url, method: .get).responseJSON { (responseData: DataResponse <Any>) in
                if let error = responseData.error {
                    print("Error: " + error.localizedDescription)
                } else if let data = responseData.data {
                    if let user = try? JSONDecoder().decode(Users.self, from: data) {
                        success(user)
                    }
                }
            }
        }
    }
}
