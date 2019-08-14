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
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.borderColor = UIColor.black.cgColor
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        avatarImage.clipsToBounds = true
    }
    
    func setupCell(withUser user: User) {
        nameLabel.text = user.login
        avatarImage.image = UIImage(named: "Octocat")
    }
}
