//
//  ListSeasonTourViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 7/1/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class ListSeasonTourViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBAction func showSideMenu(_ sender: UIButton) {
        SidemenuAction.showSideMenu(currentViewController: self)
    }
    
    var listSeasonTour: [SeasonTour]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SeasonTourTableViewCell", bundle: nil), forCellReuseIdentifier: "SeasonTourTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listSeasonTour = SeasonTourDAO.init().getAll()! as! [SeasonTour]
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
        
        return cell
    }
    
}
