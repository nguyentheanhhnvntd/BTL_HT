//
//  ListTicketViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 7/1/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class ListTicketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func showSideMenu(_ sender: UIButton) {
        SidemenuAction.showSideMenu(currentViewController: self)
    }
    var listTicket: [Ticket]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TicketTableViewCell", bundle: nil), forCellReuseIdentifier: "TicketTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listTicket = TicketDAO.init().getAll()! as! [Ticket]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTicket.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketTableViewCell") as! TicketTableViewCell
        
        let ticket = listTicket[indexPath.row]
        
        let place = (ticket.seasonTour?.tour?.from)! + " -> " + (ticket.seasonTour?.tour?.to)!
        
        cell.place.text = place
        cell.adultChildren.text = "Adult/Child: \(Int(ticket.adultSlot))/\(Int(ticket.childrenSlot))"
        cell.client.text = ticket.booking?.client?.name
        var date = String(describing: ticket.booking!.bookingDate!)
        date = date.substring(to: date.index(date.startIndex, offsetBy: 19))
        cell.bookingDate.text = date
        return cell
    }

}
