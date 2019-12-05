//
//  HospitalCell.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import UIKit

class HospitalCell: UITableViewCell {
    
    @IBOutlet weak var hospitalNameLabel: UILabel!
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var workTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: HospitalModel) {
        hospitalNameLabel.text = model.title
        locationLabel.text = model.address
        workTimeLabel.text = model.schedule
    }
    
}
