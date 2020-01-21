//
//  HospitalDetailesController.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

final class HospitalDetailsController: UIViewController {
    var viewModel: HospitalDetailsModelType!
    
    @IBOutlet weak var tableViewShadowView: UIView!
    @IBOutlet private weak var gradientView: UIView!
    @IBOutlet private weak var lookOnMapButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var map: MapView!
    @IBOutlet private weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setUpClosure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.sendEventOpen()
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func pushToMap(_ sender: Any) {
        if let point = viewModel.point {
            self.viewModel.sendEventMap()
            UrlOpenHelper.openDirections(to: point)
        }
    }
    
    private func configure() {
        if viewModel.isHUD {
            showHud()
        }
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
            map.moveToLocation(coordinate: point)
        }
                
        gradientView.layer.shadowColor = UIColor.black.cgColor
        gradientView.layer.shadowOpacity = 1
        gradientView.layer.shadowOffset = CGSize(width: 0, height: 3)
        gradientView.layer.shadowRadius = 70
        gradientView.layer.shouldRasterize = true
        gradientView.layer.rasterizationScale = UIScreen.main.scale
         
    }
    
    private func configureOpenMapBtn() {
        lookOnMapButton.backgroundColor = UIColor(red: 0, green: 0.48, blue: 1, alpha: 1)
        
        lookOnMapButton.layer.cornerRadius = 20.0
        lookOnMapButton.layer.borderWidth = 0.5
        lookOnMapButton.layer.borderColor = Style.Color.borderColor.cgColor
        lookOnMapButton.layer.applySketchShadow(color: Style.Color.shadowColor, alpha: 0.14, xxx: 0, yyy: 4, blur: 12, spread: 0)
    }
    
    private func configureTableView() {
        
        tableViewShadowView.layer.shadowColor = UIColor.lightGray.cgColor
        tableViewShadowView.layer.shadowOpacity = 0.7
        tableViewShadowView.layer.shadowOffset = .zero
        tableViewShadowView.layer.shadowRadius = 4
        tableViewShadowView.layer.shadowPath = UIBezierPath(rect: tableViewShadowView.bounds).cgPath
        tableViewShadowView.layer.shouldRasterize = true
        tableViewShadowView.layer.rasterizationScale = UIScreen.main.scale
        
        tableView.register([HospitalDetailsTableViewCell.className, TitleTableViewCell.className])
        tableView.setDataSource(self)
        tableView.layer.cornerRadius = 10.0
        self.tableView.reloadData()
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
            
            cell.configure(model: viewModel.hospitalInfoDetailModels[indexPath.row], viewModel.getCellSeparator(indexPath.row))
            return cell
        }
    }
}
