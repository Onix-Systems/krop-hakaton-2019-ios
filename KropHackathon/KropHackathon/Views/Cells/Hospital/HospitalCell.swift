//
//  HospitalCell.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

final class HospitalCell: UITableViewCell {
    
    @IBOutlet weak var border: UIView!
    @IBOutlet private weak var hospitalNameLabel: UILabel!
    @IBOutlet private weak var wrapperView: UIView!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var workTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(model: HospitalModel) {
        border.backgroundColor = UIColor(red: 0.8, green: 0.82, blue: 0.84, alpha: 0.5)
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
