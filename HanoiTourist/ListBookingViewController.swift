//
//  ListBookingViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/27/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class ListBookingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddBookingViewControllerDelegate {
    
    @IBAction func search(_ sender: UIButton) {
    }
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBAction func showSideMenu(_ sender: UIButton) {
        SidemenuAction.showSideMenu(currentViewController: self)
    }
    
    var listBooking: [Booking]!
    var employee = EmployeeDAO.init().getAll()![0] as! Employee
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "BookingTableViewCell", bundle: nil), forCellReuseIdentifier: "BookingTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ListBookingViewController viewWillAppear")
        listBooking = BookingDAO.init().getAll()! as! [Booking]
        print("BOOKING COUNT: ", listBooking.count)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookingTableViewCell") as! BookingTableViewCell
        let booking = listBooking[indexPath.row]
        
        cell.paidState.isOn = booking.paid
        
        var date = String(describing: booking.bookingDate!)
        date = date.substring(to: date.index(date.startIndex, offsetBy: 19))
        cell.bookingDate.text = date
        cell.client.text = booking.client?.name
        
        let tickets = booking.tickets?.allObjects as! [Ticket]
        var totalSlot = 0
        for ticket in tickets {
            totalSlot += Int(ticket.adultSlot) + Int(ticket.childrenSlot)
        }
        cell.slot.text = "Total slot: \(totalSlot)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBooking.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let booking = listBooking[indexPath.row]
        showEditBookingVC(booking: booking)
    }
    
    func showEditBookingVC(booking: Booking) {
        let editBookingVC = UIStoryboard.init(name: "Booking", bundle: nil).instantiateViewController(withIdentifier: "EditBookingViewController") as! EditBookingViewController
        editBookingVC.employee = employee
        editBookingVC.booking = booking
        self.present(editBookingVC, animated: false, completion: nil)
    }
    
    
    func addBookingDone() {
        showToast(message: "Add Success")
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAddBookingVC" {
            (segue.destination as! AddBookingViewController).delegate = self
            (segue.destination as! AddBookingViewController).employee = employee
        }
     }
 
    
}
