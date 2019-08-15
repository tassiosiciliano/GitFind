//
//  Repo.swift
//  GitFind
//
//  Created by Tassio Siciliano on 13/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import Foundation

struct Repo: Codable {
    let id: Int
    let name: String
    let repoDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case repoDescription = "description"
    }
}
