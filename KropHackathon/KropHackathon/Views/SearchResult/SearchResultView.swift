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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.nibSetup()
    }
    
    func configure(_ models: [HospitalModel]) {
        self.models = models
        
    }

    func show(_ state: Bool) {
        self.tableView.isHidden = state
    }
    
}

extension SearchResultView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension SearchResultView: UITableViewDelegate {
    
}
