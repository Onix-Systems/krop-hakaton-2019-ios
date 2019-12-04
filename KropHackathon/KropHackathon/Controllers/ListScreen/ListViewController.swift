//
//  ListViewController.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {
    var viewModel: ListViewModelType!

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        configureNavigationBar()
        tableView.reloadData()
    }
    
    private func configureNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backBarButton
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        btn.addTarget(self, action: #selector(backBtnClicked), for: .touchUpInside)
        btn.setImage(Style.Images.backIcon, for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)

//        navigationController?.title = "Ультразвуковi дослiдження"
        let titleColor = UIColor(red: 0.01, green: 0.10, blue: 0.19, alpha: 1.0)
        let titleFont = UIFont(name: "SFProRoundedBold", size: 25.0)
        let textAttributes = [NSAttributedString.Key.foregroundColor: titleColor, NSAttributedString.Key.font: titleFont]
        navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key: Any]

    }
    
    @objc
    func backBtnClicked() {
        print("backBtn clicked")
    }
}

extension ListViewController: UITableViewDelegate {
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "List \(indexPath.row)"
        return cell
    }
    
    
}
