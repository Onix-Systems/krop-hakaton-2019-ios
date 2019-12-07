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
        if model.address.contains("null") {
            locationLabel.text = "інформація відсутня"
        } else {
            locationLabel.text = model.address
        }
        if model.schedule.contains("null") {
            workTimeLabel.text = "інформація відсутня"
        } else {
            workTimeLabel.text = model.schedule
        }
    }
    
}
