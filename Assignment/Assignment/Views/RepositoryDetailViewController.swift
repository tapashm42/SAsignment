//
//  RepositoryDetailViewController.swift
//  Assignment
//
//  Created by TapashM on 16/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UITableViewController {
    
    /// This is an **indicator** to show *loading* while downloading data from server.
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    /// This is a **ViewModel** object of *RepositoryDescriptionViewModel* holds the data and presentation logic.
    var repositoryDescriptionViewModel =  RepositoryDescriptionViewModel()
    
    /// This is a **ViewModel** object of *RepoIssueViewModel* holds the data and presentation logic.
    var repoIssueViewModel =  RepoIssueViewModel()
    
    /// This is a **ViewModel** object of *RepoContributorViewModel* holds the data and presentation logic.
    var repoContributorViewModel =  RepoContributorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
        getRepoIssueList()
    }
    
    /**
     This method does all the neccessary UI setup including navigation title size,tableview cell register,activityIndicator.
     */
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
            return self.repoContributorViewModel.numberOfRowsInSection()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getSpecificCell(tableView: tableView, indexPath: indexPath)
        return cell
    }
    
}

extension RepositoryDetailViewController {
    
    /**
     This is a method gives specific cell based on specific section or cell identifier.
     - Parameter tableView: It's the tableview of the class.
     - Parameter indexPath:  `IndexPath` represents the path to a specific node in a tree of nested array collections.
     - Returns: A table view cell containing all the necessary ui elements.
     */
    func getSpecificCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        indexPath.row
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
            let contributor = self.repoContributorViewModel.objectAt(indexPath.row)
            cell.textLabel?.text = contributor.commit?.committer?.name
            return cell
            
        }
        
    }
}

extension RepositoryDetailViewController{
    
    /**
     This is a method fetches issues related to a specific repository.
     */
    func getRepoIssueList() {
        
        self.activityIndicator.startAnimating()
        
        ANetworkHelpher.shared.getIssuesSpecificToRepository(repoName: self.repositoryDescriptionViewModel.repoDetailModel.fullName, language: self.repositoryDescriptionViewModel.repoDetailModel.language, success: { [weak self] (issues) in
            guard let issues = issues else{return}
            self?.repoIssueViewModel.addIssuesToViewModel(issues)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
                self?.getRepoContributorList()
            }
            }, failure: { [weak self] (networkError) in
                print(networkError.statusCode)
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
                self?.getRepoContributorList()
        })
        
    }
}

extension RepositoryDetailViewController{
    
    /**
     This is a method fetches contributor list related to a specific repository.
     */
    func getRepoContributorList() {
        
        self.activityIndicator.startAnimating()
        
        ANetworkHelpher.shared.getContributorsSpecificToRepository(repoName: self.repositoryDescriptionViewModel.repoDetailModel.fullName, language: self.repositoryDescriptionViewModel.repoDetailModel.language, success: { [weak self] (contributors) in
            guard let contributors = contributors else{return}
            self?.repoContributorViewModel.addContributorsToRepoViewModel(contributors)
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


