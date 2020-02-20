//
//  RepoRequest.swift
//  GitFind
//
//  Created by Tassio Siciliano on 14/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import Foundation

class RepoRequest {
    
    static func getRepos(repoURL: String?,
                               success: @escaping (_ user: [Repo]) -> Void,
                               failure: @escaping () -> Void) {
        if let repo = repoURL {
            let url = URL(string: repo)!
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("error: \(error)")
                } else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                    }
                    if let data = data {
                        if let repo = try? JSONDecoder().decode([Repo].self, from: data) {
                            success(repo)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
