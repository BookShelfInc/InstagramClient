//
//  Extensions.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/3/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        
        switch hex.count {
            case 3: // RGB (12-bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UIScrollView {
    func updateContentViewSize() {
        var newHeight: CGFloat = 0
        for view in subviews {
            let ref = view.frame.origin.y + view.frame.height
            if ref > newHeight {
                newHeight = ref
            }
        }
        let oldSize = contentSize
        let newSize = CGSize(width: oldSize.width, height: newHeight + 100)
        contentSize = newSize
    }
}

extension UIImage {
    static func resizedCroppedImage(image: UIImage, newSize:CGSize) -> UIImage? {
        var ratio: CGFloat = 0
        var delta: CGFloat = 0
        var offset = CGPoint.zero
        
        if image.size.width > image.size.height {
            ratio = newSize.width / image.size.width
            delta = (ratio * image.size.width) - (ratio * image.size.height)
            offset = CGPoint(x: delta / 2, y: 0)
        } else {
            ratio = newSize.width / image.size.height
            delta = (ratio * image.size.height) - (ratio * image.size.width)
            offset = CGPoint(x: 0, y: delta / 2)
        }
        
        let clipRect = CGRect(x: -offset.x, y: -offset.y, width: (ratio * image.size.width) + delta, height: (ratio * image.size.height) + delta)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0.0)
        UIRectClip(clipRect)
        image.draw(in: clipRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    private func imageFromServerURL(urlString: String) -> UIImage? {
        var imageData: Data?
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                return
            }
            
            imageData = data
            
        }).resume()
        
        let image = UIImage(data: imageData!)
        return image
    }
    
}

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}

