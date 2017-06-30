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
    
    class func instanceFromNib() -> TicketInfomationView {
        return UINib(nibName: "TicketInfomationView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TicketInfomationView
    }
    
    func setInfo() {
        if let seasonTour = ticket.seasonTour {
            
            let startDateStr = String(describing: seasonTour.start!)
            let index = startDateStr.characters.index(of: " ")!
            startDate.text = "Start: " + startDateStr.substring(to: index)
            
            let endDateStr = String(describing: seasonTour.end!)
            endDate.text = "End: " + endDateStr.substring(to: index)
            
            if let tour = seasonTour.tour {
                startPlace.text = tour.from
                destPlace.text = tour.to
                let (day, night) = Util.convertDuration(duration: tour.duration!)
                duration.text = "\(day) days, \(night) night"
            }
        }
        adultSlot.text = String(describing: ticket.adultSlot)
        childrenSlot.text = String(describing: ticket.childrenSlot)
        totalPrice.text = String(describing: ticket.price) + " vnd"
    }
    


}
