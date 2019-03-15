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
    private var languageRepoListViewModel = LanguageRepoListViewModel()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.showsSearchResultsButton = true
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = searchController.searchBar
    }
    
}



extension LanguageRepoListViewController: UISearchResultsUpdating,UISearchBarDelegate{
    
    func updateSearchResults(for searchController: UISearchController) {
        //
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBar.text\(String(describing: searchBar.text))")
        guard let searchText = searchBar.text else {
            return
        }
        getlanguageRepoList(language: searchText)
    }
    
}

extension LanguageRepoListViewController{
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.languageRepoListViewModel.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let item = self.languageRepoListViewModel.objectAt(indexPath.row)
        cell.textLabel?.text = item.fullName
        cell.textLabel?.backgroundColor = UIColor.blue
        return cell
    }
    
}

extension LanguageRepoListViewController{
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension LanguageRepoListViewController{
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

extension LanguageRepoListViewController{
    
    func getlanguageRepoList(language: String){
        
        ANetworkHelpher.shared.getRepositorySpecificToLanguage(language: language, success: { [weak self](items) in
            guard let items = items else{return}
            self?.languageRepoListViewModel.addLanguageRepoViewModel(items)
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }, failure: { (networkError) in
            print(networkError.statusCode)
        })
        
    }
}


