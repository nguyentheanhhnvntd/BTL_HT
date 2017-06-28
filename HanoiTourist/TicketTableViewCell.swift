//
//  TicketTableViewCell.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/28/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol  TicketTableViewCellDelegate {
    func choose(seasonTour: SeasonTour)
}

class TicketTableViewCell: UITableViewCell {
    
    var seasonTour: SeasonTour!
    var delegate: TicketTableViewCellDelegate!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var slot: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addGestureRecognizer(UILongPressGestureRecognizer.init(target: self, action: #selector(longPressed)))
    }
    
    func longPressed() {
        delegate.choose(seasonTour: seasonTour)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
