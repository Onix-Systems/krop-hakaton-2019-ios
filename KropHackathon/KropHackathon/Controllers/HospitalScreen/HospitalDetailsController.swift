//
//  HospitalDetailesController.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit
import GoogleMaps

final class HospitalDetailsController: UIViewController {
    var viewModel: HospitalDetailsModelType!
    
    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var lookOnMapButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var map: MapView!
    @IBOutlet private weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showHud()
        configure()
        setUpClosure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func pushToMap(_ sender: Any) {
        if let point = viewModel.point {
            UrlOpenHelper.openDirections(to: point)
        }
    }
    
    private func configure() {
        configureMap()
        configureOpenMapBtn()
        configureTableView()
    }
    
    private func setUpClosure() {
        viewModel.didLoadData = {
            DispatchQueue.main.async {
                self.hideHUD()
                self.tableView.reloadData()
                self.configureMap()
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
    
    private func configureMap() {
        if let point = viewModel.point {
            map.customSetup(with: point)
            map.addMarker(coordinate: point)
            map.moveToLocation(location: point)
        }
        
        let gradient = CAGradientLayer()
        var bounds = self.navigationController?.navigationBar.bounds
        bounds?.size.height += UIApplication.shared.statusBarFrame.size.height
        
        if let bounds = bounds {
            gradient.frame = bounds
        }
        gradient.colors = [UIColor.lightGray.cgColor, UIColor.clear.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        self.gradientView.layer.addSublayer(gradient)
    }
    
    private func configureOpenMapBtn() {
        lookOnMapButton.layer.cornerRadius = 16.0
        lookOnMapButton.layer.borderWidth = 0.5
        lookOnMapButton.layer.borderColor = Style.Color.borderColor.cgColor
        lookOnMapButton.layer.applySketchShadow(color: Style.Color.shadowColor, alpha: 0.14, xxx: 0, yyy: 4, blur: 12, spread: 0)
    }
    
    private func configureTableView() {
        tableView.register([HospitalDetailsTableViewCell.className, TitleTableViewCell.className])
        tableView.setDataSource(self)
        tableView.layer.cornerRadius = 10
        tableView.reloadData()
        tableView.layer.applySketchShadow(color: Style.Color.shadowColor, alpha: 0.3, xxx: 0, yyy: -8, blur: 8, spread: 0)
    }
    
    @IBAction func closeBtnClicked(_ sender: UIButton) {
        viewModel.goBack()
    }
}

extension HospitalDetailsController: UITableViewDataSource {
    
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
