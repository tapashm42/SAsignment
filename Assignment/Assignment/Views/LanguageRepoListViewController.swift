//
//  LanguageRepoListViewController.swift
//  Assignment
//
//  Created by TapashM on 14/03/19.
//  Copyright © 2019 Tapash. All rights reserved.
//

import UIKit

class LanguageRepoListViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    private var languageRepoListViewModel = LanguageRepoListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialUI()
    }
    
    func setupInitialUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Please enter any language."
        searchController.searchBar.showsSearchResultsButton = true
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = searchController.searchBar
        self.tableView.tableFooterView = UIView()
        
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        self.view.addSubview(activityIndicator)
    }
}

extension LanguageRepoListViewController: UISearchResultsUpdating,UISearchBarDelegate{
    
    func updateSearchResults(for searchController: UISearchController) {
        //
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        getlanguageRepoList(language: searchText)
    }
}

extension LanguageRepoListViewController {
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.languageRepoListViewModel.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchListCell", for: indexPath)
        let item = self.languageRepoListViewModel.objectAt(indexPath.row)
        cell.textLabel?.text = item.fullName
        cell.textLabel?.backgroundColor = UIColor.clear
        return cell
    }
    
}

extension LanguageRepoListViewController {
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movetoRepositoryViewController(index: indexPath.row)
    }
    
    private func movetoRepositoryViewController(index: Int){
        
        searchController.dismiss(animated: false, completion: nil)
        let mRepositoryViewController = UIStoryboard.initializeViewController(RepositoryDetailViewController.self)
        let item = self.languageRepoListViewModel.objectAt(index)
        if  let fName = item.fullName ,let description = item.description , let repoId = item.id  {
            mRepositoryViewController.repositoryDescriptionViewModel.repoDetailModel = mRepositoryViewController.repositoryDescriptionViewModel.constructRepoModel(description: description, fName: fName, repoId: repoId,language: self.searchController.searchBar.text ?? "")
        }
        self.navigationController?.pushViewController(mRepositoryViewController, animated: true)
    }
}

extension LanguageRepoListViewController {
    
    func getlanguageRepoList(language: String) {
        
        self.activityIndicator.startAnimating()
        self.languageRepoListViewModel.removeAllPreviousData()
        ANetworkHelpher.shared.getRepositorySpecificToLanguage(language: language, success: { [weak self] (items) in
            guard let items = items else{return}
            self?.languageRepoListViewModel.addLanguageRepoViewModel(items)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
            }
            }, failure: { [weak self]  (networkError) in
                print(networkError.statusCode)
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
        })
    }
}



