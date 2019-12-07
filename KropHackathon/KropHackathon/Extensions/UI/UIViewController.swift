//
//  UIViewController.swift
//  KeyStoneHome
//
//  Created by Tetiana Nieizviestna on 6/6/19.
//  Copyright © 2019 KeyStoneHome. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    func showHud() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.isUserInteractionEnabled = false
    }

    func hideHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}
