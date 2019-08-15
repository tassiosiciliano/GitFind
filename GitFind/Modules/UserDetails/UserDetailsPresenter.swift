//
//  UserDetailsPresenter.swift
//  GitFind
//
//  Created by Tassio Siciliano on 14/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import Foundation

class UserDetailsPresenter {
    
    // MARK: - PROPERTIES
    var viewController: UserDetailsViewController?
    var repoList: [Repo] = []
    
    // MARK: - METHODS
    func getRepos(url: String) {
        RepoRequest.getRepos(url: url, success: { (repos) in
            self.repoList = repos
            if repos.isEmpty {
                self.viewController?.showEmptyState()
            }
            self.viewController?.tableView.reloadData()
        }) {
            print("Error")
        }
    }
}
