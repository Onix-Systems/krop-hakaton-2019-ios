//
//  HospitalDetailsTableViewCell.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 05.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit

enum DetailsInfoType {
    case address
    case schedule
    case closedTime
    case none
}

protocol HospitalDetailsCellViewModelType: AnyObject {
    var infoType: DetailsInfoType { get set }
    var infoTypeStr: String { get set }
    var info: String { get set }
}

final class HospitalDetailsCellViewModel: HospitalDetailsCellViewModelType {
    var infoType: DetailsInfoType
    var infoTypeStr: String
    var info: String
    
    init(infoType: DetailsInfoType, infoTypeStr: String, info: String) {
        self.infoType = infoType
        self.infoTypeStr = infoTypeStr
        self.info = info
    }
}

final class HospitalDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var infoTypeIcon: UIImageView!
    @IBOutlet private weak var infoTypeLabel: UILabel!
    @IBOutlet private weak var infoLabel: UILabel!
    
    @IBOutlet private weak var imageWidthConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var topSeparatorView: UIView!
    @IBOutlet private weak var bottomSeparatorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(model: HospitalDetailsCellViewModelType) {
        imageWidthConstraint.constant = model.infoType == .none ? 0 : 20
        
        switch model.infoType {
        case .address:
            infoTypeIcon.image = Style.Images.locationIcon
        case .schedule:
            infoTypeIcon.image = Style.Images.scheduleIcon
        case .closedTime:
            infoTypeIcon.image = Style.Images.closedTimeIcon
        case .none:
            break
        }
        topSeparatorView.isHidden = model.infoType != .none
        bottomSeparatorView.isHidden = model.infoType != .none

        infoTypeLabel.text = model.infoTypeStr
        infoLabel.text = model.info
        
    }
}
