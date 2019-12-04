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
        // Initialization code

        wrapperView.layer.cornerRadius = Style.Radius.defaultRadius
        wrapperView.layer.borderWidth = 0.5
        wrapperView.layer.borderColor = Style.Color.borderColor.cgColor
        wrapperView.layer.applySketchShadow(color: Style.Color.shadowColor, alpha: 0.14, xxx: 0, yyy: 4, blur: 12, spread: 0)
    }
    
    func configure() {
        hospitalNameLabel.text = "Комунальне некомерційне підприємство “Клінічна дитяча міська поліклініка” Міської ради міста Кропивницького"
        locationLabel.text = "Вул. Шевченка, 36"
        workTimeLabel.text = "Пн-Пт 08:00 - 16:00"
    }
    
    
    
}
