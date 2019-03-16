//
//  RepositoryDetailViewController.swift
//  Assignment
//
//  Created by TapashM on 16/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UITableViewController {

    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    var repositoryDescriptionViewModel =  RepositoryDescriptionViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
    }
    
    func setupInitialUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.register(UINib.init(nibName: "ARepoDescriptionCell", bundle: nil), forCellReuseIdentifier: "ARepoDescriptionCell")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ARepoIssueCell")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ARepoContributorCell")
        self.tableView.estimatedRowHeight = 30
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView()
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        self.view.addSubview(activityIndicator)
    }
}

extension RepositoryDetailViewController {
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
        
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return CellType.allCases[section].HeaderTitle
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let _section = CellType.allCases[section]
        switch _section {
        case .descriptionCell:
            return 1
        case .issuecell:
            return 3
        case .contributorCell:
            return 3

        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getSpecificCell(tableView: tableView, indexPath: indexPath)
        return cell
    }
    
}


extension RepositoryDetailViewController {
    
    func getSpecificCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        let section = CellType.allCases[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: section.cellIdentifier, for: indexPath)
        cell.selectionStyle = .none
        cell.layoutIfNeeded()
        cell.setNeedsLayout()
        switch section {
        case .descriptionCell:
            let cell = cell as! ARepoDescriptionCell
            cell.repoDetailModel = self.repositoryDescriptionViewModel.repoDetailModel
             return cell
        default:
            return cell
        }

    }
}

