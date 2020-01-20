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
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchResult: SearchResultView!
    @IBOutlet private weak var cancelButton: UIButton!
    
    @IBOutlet private weak var aboutButton: UIButton!
    
    @IBAction func cancelTapped(_ sender: Any) {
        configureSearchMode(false)
        searchBar.endEditing(true)
        searchBar.text = ""
    }
    
    @IBAction func aboutBtnClicked(_ sender: UIButton) {
        self.viewModel.sendEventOpenAbout()
        let text = "Onix-Systems \n\n App for search medical equipment and services in Kropyvnitskyi \n\n iOS developers: \n Olena Drobko, Tetiana Nieizviestna \n\n  Designer: \n Max Honcharov"
        let alert = UIAlertController(title: "About", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Terms of use & Privacy Policy", style: .default, handler: { _ in
            if let url = URL(string: "https://onix-systems-krop-hakaton-2019.staging.onix.ua/terms-of-use-and-privacy-policy") {
                self.viewModel.sendEventOnix()
                UIApplication.shared.open(url)
            }
        }))
        alert.addAction(UIAlertAction(title: "Onix-Systems.com", style: .default, handler: { _ in
            if let url = URL(string: "https://onix-systems.com") {
                self.viewModel.sendEventOnix()
                UIApplication.shared.open(url)
            }
        }))
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet private weak var cancelLeading: NSLayoutConstraint!
    @IBOutlet private weak var searchBarTraling: NSLayoutConstraint!
    @IBOutlet private weak var cancelTraling: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHud()
        configure()
        setupClosure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
        self.viewModel.sendEventApp()
    }
    
    private func configureNavigationBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.isTranslucent = true
    }
    
    private func configure() {
        tableView.register([ServiceCell.identifier])
        tableView.setDataSource(self, delegate: self)
        tableView.reloadData()
        
        searchBar.delegate = self
        searchBar.isUserInteractionEnabled = true
        searchResult.configure()
    }
    
    private func setupClosure() {
        searchResult.didSelected = { [weak self] row in
            DispatchQueue.main.async {
                self?.hideHUD()
                self?.viewModel.openDetails(row, text: self?.searchBar.text ?? "")
            }
        }
        
        viewModel.didLoadData = {
            DispatchQueue.main.async { [weak self] in
                self?.hideHUD()
                self?.tableView.reloadData()
                self?.searchResult.update(self?.viewModel.searchModels ?? [])
            }
        }
        
        viewModel.didLoadFailed = { [weak self] error in
            DispatchQueue.main.async {
                self?.hideHUD()
                let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
            
        }
    }
    
    private func configureSearchMode(_ state: Bool) {
        showCancel(state)
        searchResult.configure()
        searchResult.isHidden = !state
        tableView.isHidden = state
        titleLabel.isHidden = state
        if state {
            searchResult.clean()
        }
    }
    
    private func showCancel(_ state: Bool) {
        cancelButton.isHidden = !state
        cancelTraling.isActive = state
        cancelTraling.isActive = state
        searchBarTraling.isActive = !state
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
        return .init(signOf: tableView.bounds.size.width, magnitudeOf: tableView.bounds.size.width / 2.3)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: ServiceCell = tableView.dequeCell(for: indexPath) else { return UITableViewCell() }
        cell.configure(viewModel.serviceModels[indexPath.row])
        cell.frame.size.width = tableView.frame.size.width
        
        return cell
    }
}

extension MainViewController: UISearchBarDelegate {
 
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        configureSearchMode(true)
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(text: searchBar.text)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
