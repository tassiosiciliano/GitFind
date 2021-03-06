//
//  MainTableViewCell.swift
//  GitFind
//
//  Created by Tassio Siciliano on 09/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    // MARK: - OUTLETS
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        roundImage()
    }

    // MARK: - METHODS
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func roundImage() {
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        avatarImage.layer.masksToBounds = false
        avatarImage.clipsToBounds = true
    }
    
    func setupCell(withUser user: Users) {
        
        nameLabel.text = user.login
        
        if let avatarUrl = URL(string: user.avatarURL ?? "") {
            self.avatarImage.load(url: avatarUrl)
        }
    }
}
