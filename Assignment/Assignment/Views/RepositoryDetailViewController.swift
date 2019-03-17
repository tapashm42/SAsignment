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
    var repoIssueViewModel =  RepoIssueViewModel()
    var repoContributorViewModel =  RepoContributorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
        getRepoIssueList()
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
            return self.repoIssueViewModel.numberOfRowsInSection()
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
            
        case .issuecell:
            let issue = self.repoIssueViewModel.objectAt(indexPath.row)
            cell.textLabel?.text = issue.title
            return cell
            
        case .contributorCell:
            return cell
            
        }
        
    }
}

extension RepositoryDetailViewController{
    
    func getRepoIssueList() {
        
        self.activityIndicator.startAnimating()
        
        ANetworkHelpher.shared.getIssuesSpecificToRepository(repoName: self.repositoryDescriptionViewModel.repoDetailModel.fullName, language: self.repositoryDescriptionViewModel.repoDetailModel.language, success: { [weak self] (issues) in
            guard let issues = issues else{return}
            self?.repoIssueViewModel.addIssuesToViewModel(issues)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
            }
            }, failure: { [weak self] (networkError) in
                print(networkError.statusCode)
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
        })
        
    }
}

extension RepositoryDetailViewController{
    
    func getRepoContributorList() {
        
        self.activityIndicator.startAnimating()
        
        ANetworkHelpher.shared.getIssuesSpecificToRepository(repoName: self.repositoryDescriptionViewModel.repoDetailModel.fullName, language: self.repositoryDescriptionViewModel.repoDetailModel.language, success: { [weak self] (issues) in
            guard let issues = issues else{return}
            self?.repoIssueViewModel.addIssuesToViewModel(issues)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
            }
            }, failure: { [weak self] (networkError) in
                print(networkError.statusCode)
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
        })
        
    }
}


