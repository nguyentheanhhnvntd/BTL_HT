//
//  ClientInfomationView.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/29/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class ClientInfomationView: UIView {

    class func instanceFromNib() -> ClientInfomationView {
        return UINib(nibName: "ClientInfomationView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ClientInfomationView
    }
    
}
