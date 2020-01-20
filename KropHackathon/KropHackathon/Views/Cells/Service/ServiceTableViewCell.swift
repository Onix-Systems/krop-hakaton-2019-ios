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
    @IBOutlet weak var border: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(_ serviceName: String) {
        border.backgroundColor = UIColor(red: 0.8, green: 0.82, blue: 0.84, alpha: 0.5)
        let uzd = "УЗД"
        let isUzd = hasStrUZD(string: serviceName)
        let typeStr = isUzd ? uzd : ""
        var name = serviceName
        
        if serviceName.hasPrefix(uzd) {
            name = serviceName.removing(charactersOf: uzd)
        }
        
        let font = UIFont.sfRoundedSemibold(17)
        var attributes: [NSAttributedString.Key: Any]? = [NSAttributedString.Key.font: font,
                                                          .foregroundColor: UIColor.black]
        
        let attributedName = NSAttributedString(string: name, attributes: attributes)
        
        attributes = [NSAttributedString.Key.font: font,
                      .foregroundColor: UIColor.lightGray]

        
        let attributedSpeck = NSAttributedString(string: typeStr, attributes: attributes)
        
        let combination = NSMutableAttributedString()
        if isUzd { combination.append(attributedSpeck) }
        combination.append(attributedName)
        nameLabel.attributedText = combination
        
    }
    
    private func hasStrUZD(string: String) -> Bool {
        return string.hasPrefix("УЗД ")
    }
    
}
