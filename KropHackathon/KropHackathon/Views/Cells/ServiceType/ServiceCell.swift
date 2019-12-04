//
//  ServiceCell.swift
//  KropHackathon
//
//  Created by Альона Дробко on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import UIKit

class ServiceCell: UITableViewCell {
    
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var serviceTypeLabel: UILabel!
    @IBOutlet weak var serviceImageView: UIImageView!
    
    var model: ServiceTypeModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        serviceImageView.layer.cornerRadius = Style.Radius.defaultRadius

        wrapperView.layer.cornerRadius = Style.Radius.defaultRadius
        wrapperView.layer.borderWidth = 0.5
        wrapperView.layer.borderColor = Style.Color.borderColor.cgColor
        wrapperView.layer.applySketchShadow(color: Style.Color.shadowColor, alpha: 0.14, xxx: 0, yyy: 4, blur: 12, spread: 0)
    }
    
    func configure(_ model: ServiceTypeModel) {
        self.model = model
        
       self.serviceTypeLabel.text = model.name
        self.serviceImageView.image = UIImage(named: "redCross")
    }
}
