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
    var presenter: MainPresenter
    
    // MARK: - INIT
    required init?(coder aDecoder: NSCoder) {
        self.presenter = MainPresenter()
        super.init(coder: aDecoder)
        presenter.viewController = self
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.presenter = MainPresenter()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        presenter.viewController = self
    }
    
    // MARK: - LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigation()
        self.presenter.getUser()
    }
    
    // MARK: - METHODS
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        MainTableViewCell.registerNib(for: tableView)
    }
    
    func setupNavigation() {
        self.title = "Users"
    }
}

// MARK: - TABLEVIEW DELEGATE AND DATASOURCE
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.userList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainTableViewCell.dequeueCell(from: tableView)
        cell.setupCell(withUser: self.presenter.userList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repoUrl = self.presenter.userList[indexPath.row].reposURL
        print("\n\n REPOS URL: \(repoUrl)\n\n")
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(UserDetailsViewController(url: repoUrl)!, animated: true)
    }
}
