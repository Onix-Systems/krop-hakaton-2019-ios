//
//  ServiceTypeTableViewCell.swift
//  KropHackathon
//
//  Created by Альона Дробко on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

class ServiceTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var serviceTypeLabel: UILabel!
    @IBOutlet weak var serviceImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        wrapperView.layer.cornerRadius = Style.Radius.defaultRadius
        wrapperView.layer.borderWidth = 0.5
        wrapperView.layer.borderColor = Style.Color.borderColor.cgColor
        wrapperView.layer.applySketchShadow(color: Style.Color.shadowColor, alpha: 0.14, xxx: 0, yyy: 4, blur: 12, spread: 0)
        // Configure the view for the selected state
    }
    
}
