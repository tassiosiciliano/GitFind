//
//  UIImage+Extension.swift
//  GitFind
//
//  Created by Tassio Siciliano on 21/02/20.
//  Copyright © 2020 Tassio Siciliano. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
