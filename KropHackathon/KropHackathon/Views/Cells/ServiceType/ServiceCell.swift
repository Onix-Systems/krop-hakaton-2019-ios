//
//  ServiceCell.swift
//  KropHackathon
//
//  Created by Альона Дробко on 03.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import UIKit

class ServiceCell: UITableViewCell, UICollectionViewDataSource {
    
    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var serviceTypeLabel: UILabel!
    @IBOutlet weak var serviceImageView: UIImageView!
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    
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
        //self.servicesCollectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
}
