//
//  RepoRequest.swift
//  GitFind
//
//  Created by Tassio Siciliano on 14/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import Foundation
import Alamofire

class RepoRequest {
    
    static func getRepos(url: String?,
                         success: @escaping (_ repo: [Repo]) -> Void,
                         failure: @escaping () -> Void) {
        
        if let repoUrl = url {
            Alamofire.request(repoUrl, method: .get).responseJSON { response in
                if let error = response.error {
                    print("Error: " + error.localizedDescription)
                } else if let repo = try? JSONDecoder().decode([Repo].self, from: response.data!) {
                    print(repo)
                    success(repo)
                }
            }
        }
    }
}
