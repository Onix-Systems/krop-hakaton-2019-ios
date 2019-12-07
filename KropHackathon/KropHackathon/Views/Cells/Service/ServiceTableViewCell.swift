//
//  HospitalServiceTableViewCell.swift
//  KropHackathon
//
//  Created by Альона Дробко on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

final class ServiceTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(_ model: ServiceDetailsModel) {
        let font = UIFont.sfRoundedBold(17)
        var attributes: [NSAttributedString.Key: Any]? = [NSAttributedString.Key.font: font,
                                                          .foregroundColor: UIColor.black]
        
        let attributedName = NSAttributedString(string: model.serviceDetailsName, attributes: attributes)
        
        attributes = [NSAttributedString.Key.font: font,
                      .foregroundColor: UIColor.lightGray]
        let space = NSAttributedString(string: " ", attributes: attributes)
        let attributedSpeck = NSAttributedString(string: model.serviceTypeName, attributes: attributes)
        
        let combination = NSMutableAttributedString()
        
        combination.append(attributedSpeck)
        combination.append(space)
        combination.append(attributedName)
        nameLabel.attributedText = combination
        
    }
    
}
