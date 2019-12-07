//
//  HospitalCell.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

final class HospitalCell: UITableViewCell {
    
    @IBOutlet private weak var hospitalNameLabel: UILabel!
    @IBOutlet private weak var wrapperView: UIView!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var workTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: HospitalModel) {
        hospitalNameLabel.text = model.title
        locationLabel.text = model.address
        workTimeLabel.text = model.schedule
    }
    
}
