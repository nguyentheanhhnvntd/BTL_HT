//
//  DetailSeasonTourDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/28/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol DetailSeasonTourDialogDelegate {
    func onDismiss()
}

class DetailSeasonTourDialog: UIViewController {
    
    var seasonTour: SeasonTour!
    var delegate: DetailSeasonTourDialogDelegate!
    
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var slot: UILabel!
    
    @IBOutlet weak var duration: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var basePrice: UILabel!
    
    @IBOutlet weak var des: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailSeasonTourDialog viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("DetailSeasonTourDialog viewWillAppear")
    }
    
    func setInfo(){
        if view == nil {
            return
        }
        if let tour = seasonTour.tour {
            place.text = tour.from! + " -> " + tour.to!
            let (day, night) = Util.convertDuration(duration: tour.duration!)
            duration.text = "\(day) days, \(night) nights"
        }
        slot.text = "Available: \(seasonTour.totalSlot) slots"
        var startDate = String(describing: seasonTour.start!)
        let index = startDate.characters.index(of: " ")!
        date.text = "Start: " + startDate.substring(to: index)
        basePrice.text = "\(seasonTour.price) vnd/1 adult"
        des.text = seasonTour.des
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        delegate.onDismiss()
    }
}
