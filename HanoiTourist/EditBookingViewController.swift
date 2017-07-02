//
//  EditBookingViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 7/2/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class EditBookingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ChoosePayTypeDialogDelegate {
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    @IBOutlet weak var switchCover: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var clientLabel: UILabel!
    
    @IBOutlet weak var totalSlotLabel: UILabel!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var paidState: UISwitch!
    
    var booking: Booking!
    var listTicket: [Ticket]!
    var employee: Employee!
    
    @IBAction func deleteBooking(_ sender: UIButton) {
        print("Delete Booking")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TicketTableViewCell", bundle: nil), forCellReuseIdentifier: "TicketTableViewCell")
        listTicket = booking.tickets?.allObjects as! [Ticket]
        setInfo()
    }
    
    func setInfo() {
        
        paidState.isOn = booking.paid
        
        if paidState.isOn {
            switchCover.isUserInteractionEnabled = false
        } else {
            print("OFF")
            switchCover.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showChoosePayTypeDialog)))
        }
        
        var date = String(describing: booking.bookingDate!)
        date = date.substring(to: date.index(date.startIndex, offsetBy: 19))
        dateLabel.text = date
        clientLabel.text = booking.client?.name
        
        let tickets = booking.tickets?.allObjects as! [Ticket]
        var totalSlot = 0
        var price: Double = 0
        for ticket in tickets {
            price += ticket.price
            totalSlot += Int(ticket.adultSlot) + Int(ticket.childrenSlot)
        }
        totalSlotLabel.text = "Total slot: \(totalSlot)"
        totalPriceLabel.text = "Price: \(price)"
    }
    
    func showChoosePayTypeDialog() {
        let choosePayTypeDialogVC = UIStoryboard.init(name: "Booking", bundle: nil).instantiateViewController(withIdentifier: "ChoosePayTypeDialog") as! ChoosePayTypeDialog
        choosePayTypeDialogVC.delegate = self
        choosePayTypeDialogVC.modalPresentationStyle = .overCurrentContext
        self.present(choosePayTypeDialogVC, animated: false, completion: nil)
    }
    
    func payByBanking() {
        payRightNow(payType: "Banking")
    }
    
    func payByCash() {
        payRightNow(payType: "Cash")
    }
    
    func payRightNow(payType: String) {
        print("payRightNow \(payType)")
        booking.paid = true
        let bill = NSManagedObjectFactory.createBillNSManagedObject(booking: booking, employee: employee, payType: payType, payDate: Date.init(timeIntervalSinceNow: 0) as NSDate)
        var listBill = [Bill]()
        listBill.append(bill)
        booking.bills = NSSet.init(array: listBill)
        BookingDAO.init().add(managedObject: booking)
        BillDAO.init().add(managedObject: bill)
//        paidState.isOn = true
        paidState.setOn(true, animated: true)
        switchCover.isUserInteractionEnabled = false
        showToast(message: "Updated")
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
