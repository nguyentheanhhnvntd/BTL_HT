//
//  BookingTableViewCell.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 7/1/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
//protocol BookingTableViewCellDelegate {
//    func choose(booking: Booking)
//}
class BookingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var paidState: UISwitch!
    @IBOutlet weak var client: UILabel!
    @IBOutlet weak var slot: UILabel!
    @IBOutlet weak var bookingDate: UILabel!
    
//    var booking: Booking!
//    var delegate: BookingTableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.addGestureRecognizer(UILongPressGestureRecognizer.init(target: self, action: #selector(longPressed)))
    }
    
//    func longPressed() {
//        delegate.choose(booking: booking)
//    }
}
