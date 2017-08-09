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
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.row == 0 {
            let infoCell = tableView.dequeueReusableCell(withIdentifier: ViewConstants.reusableInfoCellIdentifier, for: indexPath) as! InfoCell
            infoCell.decorate(withText: ViewConstants.noMatchesInfoText)
            cell = infoCell
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: ViewConstants.reusableProfileCellIdentifier, for: indexPath) as! ProfileCell
        }
        return cell
    }
}
