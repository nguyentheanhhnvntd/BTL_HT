//
//  TicketTableViewCell.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 7/1/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell {

    @IBOutlet weak var client: UILabel!
    @IBOutlet weak var adultChildren: UILabel!
    @IBOutlet weak var bookingDate: UILabel!
    @IBOutlet weak var place: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
