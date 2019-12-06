//
//  SearchResultView.swift
//  KropHackathon
//
//  Created by Альона Дробко on 05.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import UIKit

class SearchResultView: UIView {
    @IBOutlet private weak var tableView: UITableView!
    
    var models: [HospitalModel] = []
    var didSelected: ((Int) -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibSetup()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.nibSetup()
    }
    
    func configure() {
        models = []
        tableView.register([HospitalCell.identifier])
        tableView.setDataSource(self, delegate: self)
        self.tableView.reloadData()
    }
    
    func update(_ models: [HospitalModel]) {
        self.models = models
         self.tableView.reloadData()
    }    
}

extension SearchResultView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: HospitalCell = tableView.dequeCell(for: indexPath) else {
            print("can't find cell")
            return UITableViewCell()
        }
        cell.configure(model: models[indexPath.row])
        return cell
    }
}

extension SearchResultView: UITableViewDelegate {
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.didSelected?(indexPath.row)
    }
}
