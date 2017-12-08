//
//  SearchUserPage.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/7/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

class SearchUserPage: BasePage {
    let searchBar = UISearchBar()
    let tableView = UITableView()
    
    var isSearching: Bool = false
    
    var data: [String] = ["Sanzhar", "Mirzhan", "Muslim", "Dauren", "Ilyas"]
    var filteredData: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search user"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        searchBar.delegate = self
        searchBar.returnKeyType = .done
        
        
        view.addSubview(searchBar)
        view.addSubview(tableView)
        
        addConstraints()
    }
    
    func addConstraints() {
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension SearchUserPage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return filteredData.count
        }
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if isSearching {
            cell?.textLabel?.text = filteredData[indexPath.row]
        } else {
            cell?.textLabel?.text = data[indexPath.row]
        }
        
        return cell!
    }
}

extension SearchUserPage: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            isSearching = true
            filteredData = data.filter {$0.contains(searchBar.text!)}
            tableView.reloadData()
        }
    }
}
