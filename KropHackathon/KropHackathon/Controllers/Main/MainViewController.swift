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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Main screen item \(indexPath.row)"
        return cell
    }
    
    
}
