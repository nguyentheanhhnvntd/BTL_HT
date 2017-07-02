//
//  BillTableViewCell.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 7/1/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class BillTableViewCell: UITableViewCell {
    @IBOutlet weak var billDate: UILabel!
    @IBOutlet weak var slot: UILabel!
    @IBOutlet weak var client: UILabel!
    @IBOutlet weak var employee: UILabel!
    @IBOutlet weak var payType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
