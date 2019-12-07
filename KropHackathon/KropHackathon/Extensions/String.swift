//
//  String.swift
//  KropHackathon
//
//  Created by Tetiana Nieizviestna on 08.12.2019.
//  Copyright © 2019 onix. All rights reserved.
//

import Foundation

extension String {
    func removing(charactersOf string: String) -> String {
        let characterSet = CharacterSet(charactersIn: string)
        let components = self.components(separatedBy: characterSet)
        return components.joined(separator: "")
    }
}
