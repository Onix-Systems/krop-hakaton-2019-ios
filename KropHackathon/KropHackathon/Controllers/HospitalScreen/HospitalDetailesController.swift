//
//  HospitalDetailesController.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

final class HospitalDetailesController: UIViewController {
    var viewModel: HospitalDetailesModelType!
    
    @IBOutlet weak var lookOnMapButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var map: MapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    @IBAction func pushToMap(_ sender: Any) {
        UrlOpenHelper.openDirections(to: viewModel.point)
        
    }
    
    private func configure() {
        
        map.customSetup(with: viewModel.point)
        map.addMarker(coordinate: viewModel.point)
        map.moveToLocation(location: CLLocation.init(latitude: 48.510942, longitude: 32.270891))
        configureNavigationBar()
        lookOnMapButton.layer.cornerRadius = 16.0
        lookOnMapButton.layer.borderWidth = 0.5
        lookOnMapButton.layer.borderColor = Style.Color.borderColor.cgColor
        lookOnMapButton.layer.applySketchShadow(color: Style.Color.shadowColor, alpha: 0.14, xxx: 0, yyy: 4, blur: 12, spread: 0)
        
        tableView.register([HospitalDetailsTableViewCell.className, TitleTableViewCell.className])
        tableView.setDataSource(self, delegate: self)
        
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
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 50, height: 50))
        titleLabel.textColor = UIColor(red: 0.01, green: 0.10, blue: 0.19, alpha: 1.0)
        titleLabel.font = UIFont.sfRoundedBold(17)
        titleLabel.text = "Ультразвуковi дослiдження"
        navigationItem.titleView = titleLabel
        
    }
    
    @objc
    func backBtnClicked() {
        viewModel.goBack()
        //        print("backBtn clicked")
    }
}

extension HospitalDetailesController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.hospitalInfoDetailModels.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell: TitleTableViewCell = tableView.dequeCell(for: indexPath) else {
            print("can't find cell")
            return UITableViewCell()
            }
            cell.configure(title: viewModel.title)
            return cell
            
        } else {
            guard let cell: HospitalDetailsTableViewCell = tableView.dequeCell(for: indexPath) else {
                print("can't find cell")
                return UITableViewCell()
            }
            cell.configure(model: viewModel.hospitalInfoDetailModels[indexPath.row - 1])
            return cell
        }
    }
    
    
}
