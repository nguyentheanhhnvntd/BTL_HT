//
//  ListSeasonTourDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/28/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol ListSeasonTourDialogDelegate {
    func selectRow(at: Int)
    func chooseRow(at: Int)
}

class ListSeasonTourDialog: UIViewController, UITableViewDelegate, UITableViewDataSource, SeasonTourTableViewCellDelegate {
    var delegate: ListSeasonTourDialogDelegate!
    var listSeasonTour: [SeasonTour]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SeasonTourTableViewCell", bundle: nil), forCellReuseIdentifier: "SeasonTourTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listSeasonTour.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 107
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeasonTourTableViewCell") as! SeasonTourTableViewCell
        
        let seasonTour = listSeasonTour[indexPath.row]
        
        if let tour = seasonTour.tour {
            cell.place.text = tour.from! + " -> " + tour.to!
        }
        cell.slot.text = "\(seasonTour.totalSlot)"
        cell.price.text = "\(seasonTour.price) vnd"
        cell.seasonTour = seasonTour
        
        var date = String(describing: seasonTour.start!)
        date = date.substring(to: date.index(date.startIndex, offsetBy: 19))
        
        let (day, night) = Util.convertDuration(duration: (seasonTour.tour?.duration)!)
        
        cell.startDate.text = date + ", (\(day)d/\(night)n)"
        
        cell.delegate = self
        return cell
        
    }
    
    func choose(seasonTour: SeasonTour) {
        if let atPosition = listSeasonTour.index(of: seasonTour) {
            print("choose atPosition \(atPosition)")
            delegate.chooseRow(at: atPosition)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt \(indexPath.row)")
        delegate.selectRow(at: indexPath.row)
    }
}
