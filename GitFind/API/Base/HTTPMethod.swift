//
//  HTTPMethod.swift
//  GitFind
//
//  Created by Tassio Siciliano on 10/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import Foundation

enum HTTPMethod {
    case get
    case post
    case put
}

extension HTTPMethod {
    var method: String {
        switch self {
        case .get:  return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        }
    }
}
