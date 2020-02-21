//
//  UserDetailsViewController.swift
//  GitFind
//
//  Created by Tassio Siciliano on 14/08/19.
//  Copyright © 2019 Tassio Siciliano. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    // MARK: - OUTLETS
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyStateLabel: UILabel!
    
    // MARK: - PROPERTIES
    var presenter: UserDetailsPresenter
    var repoUrl: String?
    
    // MARK: - INIT
    convenience init?(url: String) {
        //self.presenter = UserDetailsPresenter()
        self.init()
        presenter.viewController = self
        repoUrl = url
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.presenter = UserDetailsPresenter()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        presenter.viewController = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigation()
        presenter.getRepos(url: repoUrl ?? "")
        tableView.reloadData()
    }
    
    // MARK: - METHODS
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        UserDetailsTableViewCell.registerNib(for: tableView)
    }
    
    func setupNavigation() {
        self.title = "Repositories"
        self.emptyStateLabel.isHidden = true
    }
    
    func showEmptyState() {
        tableView.isHidden = true
        emptyStateLabel.isHidden = false
    }
}

// MARK: - TABLEVIEW DELEGATE AND DATASOURCE
extension UserDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.repoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UserDetailsTableViewCell.dequeueCell(from: tableView)
        cell.setupCell(withRepo: self.presenter.repoList[indexPath.row])
        return cell
    }
}
