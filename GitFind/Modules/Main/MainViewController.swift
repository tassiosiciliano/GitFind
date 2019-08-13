//
//  MainViewController.swift
//  GitFind
//
//  Created by Tassio Siciliano on 09/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - PROPERTIES
    var presenter = MainPresenter()
    var userList: [User] = []
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.getUser()
    }
    
    // MARK: - METHODS
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        MainTableViewCell.registerNib(for: tableView)
    }
}

// MARK: - EXTENSIONS
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainTableViewCell.dequeueCell(from: tableView)
        cell.nameLabel.text = "\(indexPath.row)"
        cell.avatarImage.image = UIImage(named: "Octocat")
        return cell
    }
}
