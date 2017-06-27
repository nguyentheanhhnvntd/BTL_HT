//
//  TicketInfomationView.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/27/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class TicketInfomationView: UIView {

    var ticket: Ticket!
    
    @IBOutlet weak var startPlace: UILabel!
    @IBOutlet weak var destPlace: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var adultSlot: UILabel!
    @IBOutlet weak var childrenSlot: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    func setInfo() {
        if let seasonTour = ticket.seasonTour {
            startDate.text = (String(describing: seasonTour.start))
            endDate.text = (String(describing: seasonTour.end))
            if let tour = seasonTour.tour {
                startPlace.text = tour.from
                destPlace.text = tour.to
                let (day, night) = Util.convertDuration(duration: tour.duration!)
                duration.text = "\(day) days, \(night) night"
            }
        }
        adultSlot.text = String(describing: ticket.adultSlot)
        childrenSlot.text = String(describing: ticket.childrenSlot)
        totalPrice.text = String(describing: ticket.price)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
