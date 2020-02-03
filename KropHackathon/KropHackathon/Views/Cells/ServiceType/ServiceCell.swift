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
    
    @IBOutlet weak var tagsImageView: UIImageView!
    @IBOutlet weak var tagsListView: TagListView!
    @IBOutlet private weak var servicesLabel: UILabel!
    @IBOutlet private weak var wrapperView: UIView!
    @IBOutlet private weak var serviceTypeLabel: UILabel!
    @IBOutlet private weak var serviceImageView: UIImageView!
    
    var model: ServiceTypeModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        serviceImageView.layer.cornerRadius = Style.Radius.defaultRadius
        wrapperView.layer.cornerRadius = 11.0
        
        tagsListView.delegate = self
    }
    
    func configure(_ model: ServiceTypeModel) {
        self.model = model.copy()
        self.wrapperView.backgroundColor = self.model.backColor
        
        self.textChanger()
        self.serviceTypeLabel.text = self.model.name
        self.serviceImageView.image = UIImage(named: self.model.image) ?? UIImage(named: "redCross")
        self.tagsImageView.image = UIImage(named: self.model.tagImage) ?? UIImage()
//        tagsListView.addTags([])
//        var i = 0
//        var more = 0
//        var f: [String] = []
//        if tagsListView.isHidden {
//            tagsListView.isHidden = false
//            let servises = self.model.services.prefix(while: { element -> Bool in
//                if element.count > 30 {
//                    return true
//                }
//                i += 1 + element.count
//                if i <= getSize() { // Max length of line
//                    more += 1
//                    f.append(element)
//                    return true
//                } else {
//                    return false
//                }
//            }).joined(separator: " | ")
//            if self.model.services.count - more == 0 {
//                self.servicesLabel.text = servises
//            } else {
//                self.servicesLabel.text = servises + " | інше(+\(self.model.services.count - more))"
//                f.append("Iнше(\(self.model.services.count - more))")
//            }
//            tagsListView.addTags([])
//            tagsListView.addTags(f)
//        }
        
        
    }
    
    private func textChanger() {
        let wordToRemove = "дослідження"
        if let range = self.model.name.range(of: wordToRemove) {
            self.model.name.removeSubrange(range)
        }
        if self.model.name.contains("Мамографічне") {
            self.model.name = "Мамографічні"
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
