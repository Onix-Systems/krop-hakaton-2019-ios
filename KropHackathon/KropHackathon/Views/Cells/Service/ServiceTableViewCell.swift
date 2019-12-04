//
//  HospitalServiceTableViewCell.swift
//  KropHackathon
//
//  Created by Альона Дробко on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(name: String, _ special: String = "") {
        let font = UIFont.sfRoundedBold(17)
        var attributes: [NSAttributedString.Key : Any]? = [NSAttributedString.Key.font: font,
                          .foregroundColor: UIColor.black]
        
        let attributedName = NSAttributedString(string: name, attributes: attributes)
        
        attributes = [NSAttributedString.Key.font: font,
                      .foregroundColor: UIColor.lightGray]
        
        let attributedSpeck = NSAttributedString(string: special, attributes: attributes)
        
        let combination = NSMutableAttributedString()
        
        combination.append(attributedSpeck)
        combination.append(attributedName)
        nameLabel.attributedText = combination
        
    }
    
}
