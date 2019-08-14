//
//  MainPresenter.swift
//  GitFind
//
//  Created by Tassio Siciliano on 09/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import Foundation

class MainPresenter {
    
    var viewController: MainViewController?
    
    var userList: [User] = []
    
    func getUser() {
        UserRequest.getUsers(success: { (users) in
            self.userList = users
            self.viewController?.tableView.reloadData()
        }) {
            print("Error")
        }
    }
}
