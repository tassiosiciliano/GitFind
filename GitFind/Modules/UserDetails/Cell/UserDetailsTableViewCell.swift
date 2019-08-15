//
//  UserDetailsTableViewCell.swift
//  GitFind
//
//  Created by Tassio Siciliano on 14/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import UIKit

class UserDetailsTableViewCell: UITableViewCell {

    // MARK: - OUTLETS
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - METHODS
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(withRepo repo: Repo) {
        titleLabel.text = repo.name
        descriptionLabel.text = repo.repoDescription
    }
}
