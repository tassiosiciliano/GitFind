//
//  MainPresenter.swift
//  GitFind
//
//  Created by Tassio Siciliano on 09/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import Foundation

class MainPresenter {
    
    // MARK: - PROPERTIES
    var viewController: MainViewController?
    var userList: [Users] = []
    
    // MARK: - METHODS
    func getUser() {
        UserRequest.getUsers(success: { (users) in
            self.userList = users
            DispatchQueue.main.async {
                self.viewController?.tableView.reloadData()
            }
        }) {
            print("Error")
        }
    }
    
    func getUserByLogin(login: String) {
        UserRequest.getUserByLogin(login: login, success: { (users) in
            self.userList = [users]
            DispatchQueue.main.async {
                self.viewController?.tableView.reloadData()
            }
        }) {
            print("Error")
        }
    }
}
