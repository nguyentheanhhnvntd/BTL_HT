//
//  AddBookingViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/28/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class AddBookingViewController: UIViewController, ListSeasonTourContainerDialogDelegate, FindSeasonTourByPlaceDialogDelegate, ChooseSlotAndPaidDialogDelegate, FindClientByNameDialogDelegate, ListClientContainerDialogDelegate, TicketInfomationViewDelegate, ClientInfomationViewDelegate, ConfirmSaveBookingDialogDelegate {
    
    var ticketInfomationView: TicketInfomationView!
    var clientInfomationView: ClientInfomationView!
    
    var employee = EmployeeDAO.init().getAll()![0] as! Employee
    var client: Client!
    var listChooseTicket = [Ticket]()
    var booking: Booking!
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func findTicket(_ sender: UIButton) {
        showFindSeasonTourByPlaceDialog()
    }
    
    func showFindSeasonTourByPlaceDialog() {
        let findSeasonTourDialog = UIStoryboard.init(name: "FindSeasonTourDialog", bundle: nil).instantiateViewController(withIdentifier: "FindSeasonTourByPlaceDialog") as! FindSeasonTourByPlaceDialog
        findSeasonTourDialog.delegate = self
        findSeasonTourDialog.modalPresentationStyle = .overCurrentContext
        self.present(findSeasonTourDialog, animated: false, completion: nil)
    }
    
    func showListSeasonTour(list: [SeasonTour]) {
        print("showListSeasonTour")
        let listSeasonTourContainerDialog = UIStoryboard.init(name: "FindSeasonTourDialog", bundle: nil).instantiateInitialViewController() as! ListSeasonTourContainerDialog
        listSeasonTourContainerDialog.delegate = self
        listSeasonTourContainerDialog.listSeasonTour = list
        listSeasonTourContainerDialog.modalPresentationStyle = .overCurrentContext
        self.present(listSeasonTourContainerDialog, animated: false, completion: nil)
    }
    
    func find(start: String, end: String) {
        let listSeasonTourToShow = SeasonTourDAO.init().findBy(startPlace: start, endPlace: end)
        if listSeasonTourToShow.count == 0 {
            showToast(message: "Doesn't match any Tour")
        } else {
            showListSeasonTour(list: listSeasonTourToShow)
        }
    }
    
    @IBAction func setClentInfo(_ sender: UIButton) {
        print("setClentInfo")
        let findClientByNameDialog = UIStoryboard.init(name: "FindClientByNameDialog", bundle: nil).instantiateViewController(withIdentifier: "FindClientByNameDialog") as! FindClientByNameDialog
        findClientByNameDialog.delegate = self
        findClientByNameDialog.modalPresentationStyle = .overCurrentContext
        self.present(findClientByNameDialog, animated: false, completion: nil)
    }
    
    @IBOutlet weak var infoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ticketInfomationView = TicketInfomationView.instanceFromNib()
        ticketInfomationView.isHidden = true
        ticketInfomationView.frame.size = infoView.frame.size
        ticketInfomationView.frame.origin = CGPoint.zero
        ticketInfomationView.delegate = self
        let swipeTicketToLeftGesture = UISwipeGestureRecognizer.init(target: self, action: #selector(ticketInfoSwipeToLeft))
        swipeTicketToLeftGesture.direction = .left
        ticketInfomationView.addGestureRecognizer(swipeTicketToLeftGesture)
        
        let swipeTicketToRightGesture = UISwipeGestureRecognizer.init(target: self, action: #selector(ticketInfoSwipeToRight))
        swipeTicketToRightGesture.direction = .right
        ticketInfomationView.addGestureRecognizer(swipeTicketToRightGesture)
        infoView.addSubview(ticketInfomationView)
        
        let swipeClientGesture = UISwipeGestureRecognizer.init(target: self, action: #selector(clientInfoSwipeToRight))
        swipeClientGesture.direction = .right
        clientInfomationView = ClientInfomationView.instanceFromNib()
        clientInfomationView.addGestureRecognizer(swipeClientGesture)
        clientInfomationView.isHidden = true
        clientInfomationView.frame.size = infoView.frame.size
        clientInfomationView.frame.origin = CGPoint.zero
        clientInfomationView.delegate = self
        infoView.addSubview(clientInfomationView)
    }
    
    func ticketInfoSwipeToLeft() {
        if let index = listChooseTicket.index(of: ticketInfomationView.ticket) {
            if index < listChooseTicket.count - 1 {
                ticketInfomationView.ticket = listChooseTicket[index + 1]
                ticketInfomationView.setInfo()
            } else if index == listChooseTicket.count - 1 {
                ticketInfomationView.isHidden = true
                clientInfomationView.isHidden = false
            }
        }
    }
    
    func ticketInfoSwipeToRight() {
        if let index = listChooseTicket.index(of: ticketInfomationView.ticket) {
            if index > 0 {
                ticketInfomationView.ticket = listChooseTicket[index - 1]
                ticketInfomationView.setInfo()
            }
        }
    }
    
    func clientInfoSwipeToRight() {
        ticketInfomationView.isHidden = false
        clientInfomationView.isHidden = true
    }
    
    func choose(seasonTour: SeasonTour) {
        print(seasonTour.tour!.to!)
        showChooseSlotAndPaidDialog(seasonTour: seasonTour)
    }
    
    func showChooseSlotAndPaidDialog(seasonTour: SeasonTour) {
        print("showChooseSlotAndPaidDialog")
        let chooseSlotAndPaidDialog = UIStoryboard.init(name: "FindSeasonTourDialog", bundle: nil).instantiateViewController(withIdentifier: "ChooseSlotAndPaidDialog") as! ChooseSlotAndPaidDialog
        
        let ticket = NSManagedObjectFactory.createTicketNSManagedObject(seasonTour: seasonTour)
        chooseSlotAndPaidDialog.ticket = ticket
        chooseSlotAndPaidDialog.delegate = self
        chooseSlotAndPaidDialog.modalPresentationStyle = .overCurrentContext
        self.present(chooseSlotAndPaidDialog, animated: false, completion: nil)
    }
    
    func comfirm(ticket: Ticket) {
        listChooseTicket.append(ticket)
        ticketInfomationView.ticket = ticket
        ticketInfomationView.setInfo()
        clientInfomationView.isHidden = true
        ticketInfomationView.isHidden = false
        
        //        let list = booking.tickets?.allObjects as! [Ticket]
        //        for ticket in list {
        //            print("\(ticket.price)" + " VNDDD")
        //        }
    }
    
    func findClient(name: String) {
        let listClient = ClientDAO.init().findBy(name: name)
        if listClient.count == 0 {
            showToast(message: "Doesn't match any client")
        } else {
            showListClient(listClient: listClient)
        }
    }
    
    func showListClient(listClient: [Client]) {
        let listClientVC = UIStoryboard.init(name: "FindClientByNameDialog", bundle: nil).instantiateInitialViewController() as! ListClientContainerDialog
        listClientVC.delegate = self
        listClientVC.listClient = listClient
        listClientVC.modalPresentationStyle = .overCurrentContext
        self.present(listClientVC, animated: false, completion: nil)
    }
    
    func choose(client: Client) {
        self.client = client
        clientInfomationView.client = client
        clientInfomationView.setInfo()
        ticketInfomationView.isHidden = true
        clientInfomationView.isHidden = false
    }
    
    func findMore() {
        showFindSeasonTourByPlaceDialog()
    }
    
    func saveBooking() {
        if listChooseTicket.count > 0 && client != nil {
            booking = NSManagedObjectFactory.createBookingNSManagedObject(listTicket: listChooseTicket, client: client)
            showConfirmSaveDialog()
        } else {
            showToast(message: "Check Ticket or Client")
        }
    }
    
    func showConfirmSaveDialog() {
        let confirmBookingDialogVC = UIStoryboard.init(name: "Booking", bundle: nil).instantiateViewController(withIdentifier: "ConfirmSaveBookingDialog") as! ConfirmSaveBookingDialog
        confirmBookingDialogVC.delegate = self
        confirmBookingDialogVC.booking = booking
        confirmBookingDialogVC.modalPresentationStyle = .overCurrentContext
        self.present(confirmBookingDialogVC, animated: false, completion: nil)
    }
    
    func payLater() {
        
        saveTicketsAndUpdateSeasonTour()
        
        booking.paid = false
        booking.bookingDate = Date.init(timeIntervalSinceNow: 0) as NSDate
        BookingDAO.init().add(managedObject: booking)
    }
    
    func payRightNow(payType: String) {
        saveTicketsAndUpdateSeasonTour()
        booking.paid = true
        booking.bookingDate = Date.init(timeIntervalSinceNow: 0) as NSDate
        BookingDAO.init().add(managedObject: booking)
        let bill = NSManagedObjectFactory.createBillNSManagedObject(booking: booking, employee: employee, payType: payType, payDate: booking.bookingDate!)
        BillDAO.init().add(managedObject: bill)
    }
    
    func saveTicketsAndUpdateSeasonTour() {
        let tickets = booking.tickets?.allObjects as! [Ticket]
        let ticketDAO = TicketDAO.init()
        let seasonTourDAO = SeasonTourDAO.init()
        for ticket in tickets {
            ticketDAO.add(managedObject: ticket)
            let seasonTour = ticket.seasonTour!
            let totalSlot = Int(seasonTour.totalSlot) - Int(ticket.adultSlot) - Int(ticket.childrenSlot)
            seasonTour.totalSlot = Int16(totalSlot)
            print(ticket.seasonTour!.totalSlot)
            seasonTourDAO.update(managedObject: ticket.seasonTour!)
        }
    }
    
    func delete(ticket: Ticket) {
        if let index = listChooseTicket.index(of: ticket) {
            listChooseTicket.remove(at: index)
            if listChooseTicket.count == 0 {
                ticketInfomationView.ticket = nil
                ticketInfomationView.isHidden = true
            } else if listChooseTicket.count > index {
                ticketInfomationView.ticket = listChooseTicket[index]
                ticketInfomationView.setInfo()
            } else {
                ticketInfomationView.ticket = listChooseTicket[index - 1]
                ticketInfomationView.setInfo()
            }
        }
    }
}
