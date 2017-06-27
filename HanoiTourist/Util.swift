//
//  Util.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/27/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class Util {
    
    static func convertDuration(duration: String) -> (day: Int, night: Int) {
        
        let position = duration.characters.index(of: "/")!
        let day = duration.substring(to: position)
        let night = duration.substring(from: duration.index(after: position))
        
        return (Int.init(day)!, Int.init(night)!)
    }
}
extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
extension String {
    func decodeToVietnamese() -> String {
        let transform = "Any-Hex/Java"
        let convertedName = self.mutableCopy() as! NSMutableString
        CFStringTransform(convertedName, nil, transform as NSString, true)
        return convertedName as String
    }
}
