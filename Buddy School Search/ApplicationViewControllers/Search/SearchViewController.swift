//
//  SearchViewController.swift
//  Buddy School Search
//
//  Created by AppStarter on 08.08.2017.
//  Copyright © 2017 Krzysztof Hołtyn. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    fileprivate struct ViewConstants {
        static let reusableProfileCellIdentifier = "ProfileCell"
        static let reusableInfoCellIdentifier = "InfoCell"
        static let noMatchesInfoText = "No matches found for current search."
    }
    
    private let searchController = UISearchController(searchResultsController: nil)
    fileprivate var profiles: [Profile]?

    @IBOutlet private weak var resultTableView: UITableView! {
        didSet {
            resultTableView.delegate = self
            resultTableView.dataSource = self
            resultTableView.registerCells([ProfileCell.self, InfoCell.self])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchControllerProperties()
        fetchProfiles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileViewController = (segue.destination as? ProfileViewController), let profile = (sender as? Profile) {
            profileViewController.title = profile.teacherLogin
            profileViewController.profileUrl = profile.profileUrl
            
            let backItem = UIBarButtonItem()
            backItem.title = "Back"
            navigationItem.backBarButtonItem = backItem
        }
    }
    
    private func fetchProfiles() {
        SearchService.getProfiles(forKeyword: "english") { [weak self] apiResult in
            guard let weakSelf = self else { return }
            switch apiResult {
            case .Success(let profiles):
                weakSelf.profiles = profiles
                weakSelf.resultTableView.reloadData()
            case .Error:
                print("błąd")
            }
        }
    }
    
    private func setSearchControllerProperties() {
//        searchController.searchResultsUpdater = self // Will be used later
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        resultTableView.tableHeaderView = searchController.searchBar
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProfileCell.defaultHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showProfileVC", sender: profiles?[indexPath.row])
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let profiles = profiles, !profiles.isEmpty else { return 1 }
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if let profiles = profiles, !profiles.isEmpty {
            let profileCell = tableView.dequeueReusableCell(withIdentifier: ViewConstants.reusableProfileCellIdentifier, for: indexPath) as! ProfileCell
            profileCell.decorate(withProfile: profiles[indexPath.row])
            cell = profileCell
        } else {
            let infoCell = tableView.dequeueReusableCell(withIdentifier: ViewConstants.reusableInfoCellIdentifier, for: indexPath) as! InfoCell
            infoCell.decorate(withText: ViewConstants.noMatchesInfoText)
            cell = infoCell
        }
        return cell
    }
}
