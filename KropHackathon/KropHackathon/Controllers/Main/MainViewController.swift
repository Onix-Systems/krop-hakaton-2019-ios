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

    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
    }

    private func configure() {
        tableView.register([ServiceCell.identifier])
        tableView.setDataSource(self, delegate: self)
        tableView.reloadData()
        
    }
    
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.openList()
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
