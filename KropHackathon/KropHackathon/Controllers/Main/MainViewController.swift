//
//  MainViewController.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 02.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    var viewModel: MainViewModelType!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    private func configure() {
    tableView.register([ServiceCell.identifier])
        searchTableView.register([HospitalCell.identifier])
        tableView.setDataSource(self, delegate: self)
    //searchTableView.dataSource = SearchHelper()
        tableView.reloadData()
        
        searchBar.delegate = self
        
    }
    
    private func configureNavigationBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isTranslucent = true

    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.openList(row: indexPath.row)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.serviceModels.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(signOf: tableView.bounds.size.width, magnitudeOf: tableView.bounds.size.width / 2.6)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: ServiceCell = tableView.dequeCell(for: indexPath) else { return UITableViewCell() }
        cell.configure(viewModel.serviceModels[indexPath.row])
        
        return cell
    }
}

extension MainViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
       
    }
    
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
         configureSearchMode(true)
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
    }
    
    func configureSearchMode(_ state: Bool) {
        searchBar.showsCancelButton = true
        searchTableView.isHidden = !state
        tableView.isHidden = state
        titleLabel.isHidden = state
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
}


class SearchHelper: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.searchModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    var model: MainViewModel!
    
    init(model: MainViewModel) {
        self.model = model
    }
}
