//
//  UIImageView.swift
//  KeyStoneHome
//
//  Created by Tetiana Nieizviestna on 5/30/19.
//  Copyright © 2019 KeyStoneHome. All rights reserved.
//

import  UIKit

extension UIImageView {
    
    func  setImage(by url: URL?, withCache: Bool = true) {
        guard let url = url else { return }
        //        self.af_setImage(withURL: url, placeholderImage: UIImage())
        loadImage(fromURL: url)
    }
    
    private func cleanCache(url: URL) {
        print("cleanCache")
        URLCache.shared.removeAllCachedResponses()
    }
    
}

extension UIImageView {
    
    func loadImage(fromURL url: URL) {
        let request = URLRequest(url: url)
        
        self.image = UIImage()
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.transition(toImage: image)
                }
            } else {
                DispatchQueue.main.async {
                    self.transition(toImage: UIImage())
                }
            }
        }).resume()
    }
    
    func transition(toImage image: UIImage?) {
        UIView.transition(with: self, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            self.image = image
        }, completion: nil)
    }
    
}
