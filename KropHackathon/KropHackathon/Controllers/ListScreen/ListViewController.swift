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
        tableView.register([ServiceTableViewCell.className, HospitalCell.className])
        tableView.setDataSource(self, delegate: self)
        
        tableView.reloadData()
    }
    
    private func configureNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.isTranslucent = false

        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backBarButton
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        btn.addTarget(self, action: #selector(backBtnClicked), for: .touchUpInside)
        btn.setImage(Style.Images.backIcon, for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)

        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        titleLabel.textColor = UIColor(red: 0.01, green: 0.10, blue: 0.19, alpha: 1.0)
        titleLabel.font = UIFont.sfRoundedBold(17)
        titleLabel.text = viewModel.screenTitle //"Ультразвуковi дослiдження"
        navigationItem.titleView = titleLabel
        
    }
    
    @objc
    func backBtnClicked() {
        viewModel.goBack()
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.screenType {
        case .serviceDetails:
            viewModel.openHospitals(row: indexPath.row)
        case . hospitals:
            viewModel.openDetails()
        }

    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.screenType {
        case .serviceDetails:
            return viewModel.serviceDetailsModels.count
        case . hospitals:
            return viewModel.hospitalModels.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.screenType {
        case .serviceDetails:
            guard let cell: ServiceTableViewCell = tableView.dequeCell(for: indexPath) else {
                print("can't find cell")
                return UITableViewCell()
            }
            cell.configure(name: viewModel.serviceDetailsModels[indexPath.row].serviceDetailsName, viewModel.serviceDetailsModels[indexPath.row].serviceTypeName)
            return cell
        case .hospitals:
            guard let cell: HospitalCell = tableView.dequeCell(for: indexPath) else {
                print("can't find cell")
                return UITableViewCell()
            }
            cell.configure(model: viewModel.hospitalModels[indexPath.row])
            return cell
        }
    }
    
    
}
