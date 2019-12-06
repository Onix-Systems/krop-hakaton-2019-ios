//
//  TitleTableViewCell.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 05.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

final class TitleTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configure(title: String) {
        titleLabel.text = title
    }
    
}
