//
//  TicketTableViewCell.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/28/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol  SeasonTourTableViewCellDelegate {
    func choose(seasonTour: SeasonTour)
}

class SeasonTourTableViewCell: UITableViewCell {
    
    var seasonTour: SeasonTour!
    var delegate: SeasonTourTableViewCellDelegate!
    
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
}
