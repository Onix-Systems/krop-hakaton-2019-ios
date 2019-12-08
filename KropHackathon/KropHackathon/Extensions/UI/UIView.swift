//
//  UIView.swift
//  KropHackathon
//
//  Created by Альона Дробко on 04.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

func nibSetup() {
    backgroundColor = .clear
    let subView = loadViewFromNib()
    subView.frame = bounds
    subView.translatesAutoresizingMaskIntoConstraints = false
    subView.clipsToBounds = true
    
    addSubview(subView)
    self.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 0).isActive = true
    self.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: 0).isActive = true
    self.topAnchor.constraint(equalTo: subView.topAnchor, constant: 0).isActive = true
    self.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: 0).isActive = true
    subView.backgroundColor = .clear
}
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
        return nibView
    }
}
