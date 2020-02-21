//
//  UserRequest.swift
//  GitFind
//
//  Created by Tassio Siciliano on 10/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import Foundation

class UserRequest {
    
    // MARK: - Get Users List
    static func getUsers(success: @escaping (_ user: [Users]) -> Void,
                             failure: @escaping () -> Void) {
        let url = URL(string: "https://api.github.com/users")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let response = response as? HTTPURLResponse {
                    print("statusCode: \(response.statusCode)")
                }
                if let data = data {
                    if let user = try? JSONDecoder().decode([Users].self, from: data) {
                        success(user)
                    }
                }
            }
        }
        task.resume()
    }
    
    // MARK: - Get User by Login    
    static func getUserByLogin(login: String?,
                               success: @escaping (_ user: Users) -> Void,
                               failure: @escaping () -> Void) {
        if let userLogin = login {
            let url = URL(string: "https://api.github.com/users/\(userLogin)")!
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("error: \(error)")
                } else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                    }
                    if let data = data {
                        if let user = try? JSONDecoder().decode(Users.self, from: data) {
                            success(user)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
