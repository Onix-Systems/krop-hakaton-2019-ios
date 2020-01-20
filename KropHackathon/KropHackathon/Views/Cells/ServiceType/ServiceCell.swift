//
//  ServiceCell.swift
//  KropHackathon
//
//  Created by Альона Дробко on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import UIKit
import TagListView

final class ServiceCell: UITableViewCell {
    
    @IBOutlet weak var tagsListView: TagListView!
    @IBOutlet private weak var servicesLabel: UILabel!
    @IBOutlet private weak var wrapperView: UIView!
    @IBOutlet private weak var serviceTypeLabel: UILabel!
    @IBOutlet private weak var serviceImageView: UIImageView!
    
    var model: ServiceTypeModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        serviceImageView.layer.cornerRadius = Style.Radius.defaultRadius
        tagsListView.delegate = self
        wrapperView.layer.cornerRadius = 11.0
//        wrapperView.layer.borderWidth = 0.5
//        wrapperView.layer.borderColor = Style.Color.borderColor.cgColor
//        wrapperView.layer.applySketchShadow(color: Style.Color.shadowColor, alpha: 0.14, xxx: 1, yyy: 4, blur: 5, spread: 0)
    }
    
    func configure(_ model: ServiceTypeModel) {
        self.model = model
        self.wrapperView.backgroundColor = model.backColor
        tagsListView.addTags([])
        var i = 0
        var more = 0
        var f: [String] = []
        if tagsListView.isHidden {
        
           tagsListView.isHidden = false 
        let servises = model.services.prefix(while: { element -> Bool in
            if element.count > 30 {
                return true
            }
            i += 1 + element.count
            if i <= getSize() { // Max length of line
                more += 1
                f.append(element)
                return true
            } else {
                return false
            }
        }).joined(separator: " | ")
        
        
        
        
        if model.services.count - more == 0 {
            self.servicesLabel.text = servises
        } else {
            self.servicesLabel.text = servises + " | інше(+\(model.services.count - more))"
            f.append("Iнше(\(model.services.count - more))")
        }
        
        tagsListView.addTags([])
        tagsListView.addTags(f)
        
        
        
        self.serviceTypeLabel.text = model.name
        self.serviceImageView.image = UIImage(named: model.image) ?? UIImage(named: "redCross")
        }
    }
    
    
    func getSize() -> Int {
        switch UIScreen.main.nativeBounds.height {
        case 1136:
            return 30
        case 1334:
            return 60
        case 1920, 2208:
            return 95
        case 2436:
            return 60
        case 2688:
            return 95
        case 1792:
            return 95
        default:
            return 50
        }
    }
}

extension ServiceCell: TagListViewDelegate {}
