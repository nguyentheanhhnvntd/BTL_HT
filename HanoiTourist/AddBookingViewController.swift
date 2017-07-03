//
//  AddBookingViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/28/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol AddBookingViewControllerDelegate {
    func addBookingDone()
}
class AddBookingViewController: UIViewController, ListSeasonTourContainerDialogDelegate, FindSeasonTourByPlaceDialogDelegate, ChooseSlotAndPaidDialogDelegate, FindClientByNameDialogDelegate, ListClientContainerDialogDelegate, TicketInfomationViewDelegate, ClientInfomationViewDelegate, ConfirmSaveBookingDialogDelegate, AddClientViewControllerDelegate {
    
    var ticketInfomationView: TicketInfomationView!
    var clientInfomationView: ClientInfomationView!
    var delegate: AddBookingViewControllerDelegate!
    
    var employee: Employee!
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
        if let ticket = ticketInfomationView.ticket {
            if let index = listChooseTicket.index(of: ticket) {
                if index < listChooseTicket.count - 1 {
                    ticketInfomationView.ticket = listChooseTicket[index + 1]
                    ticketInfomationView.setInfo()
                } else if index == listChooseTicket.count - 1 {
                    ticketInfomationView.isHidden = true
                    clientInfomationView.isHidden = false
                }
            }
        } else {
            ticketInfomationView.isHidden = true
            clientInfomationView.isHidden = false
        }
    }
    
    func ticketInfoSwipeToRight() {
        if let ticket = ticketInfomationView.ticket {
            if let index = listChooseTicket.index(of: ticket) {
                if index > 0 {
                    ticketInfomationView.ticket = listChooseTicket[index - 1]
                    ticketInfomationView.setInfo()
                }
            }
        }
    }
    
    func clientInfoSwipeToRight() {
        if listChooseTicket.count > 0 {
            ticketInfomationView.isHidden = false
            clientInfomationView.isHidden = true
        }
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
        print(listChooseTicket.count)
        ticketInfomationView.setInfo()
        
        let totalSlot = Int(ticket.seasonTour!.totalSlot) - Int(ticket.adultSlot) - Int(ticket.childrenSlot)
        ticket.seasonTour!.totalSlot = Int16(totalSlot)
        
        clientInfomationView.isHidden = true
        ticketInfomationView.isHidden = false
        
    }
    
    func findClient(name: String) {
        let listClient = ClientDAO.init().findBy(name: name)
        if listClient.count == 0 {
//            showToast(message: "Doesn't match any client")
            showAddClientVC()
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
        showClientInfoView()
    }
    
    func showClientInfoView() {
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
        print("payLater")
        booking.paid = false
        booking.bookingDate = Date.init(timeIntervalSinceNow: 0) as NSDate
        saveTicketsAndUpdateSeasonTour()
        BookingDAO.init().add(managedObject: booking)
        
        self.dismiss(animated: false, completion: {
            self.delegate.addBookingDone()
        })
    }
    
    func payRightNow(payType: String) {
        print("payRightNow \(payType)")
        booking.paid = true
        booking.bookingDate = Date.init(timeIntervalSinceNow: 0) as NSDate
        let bill = NSManagedObjectFactory.createBillNSManagedObject(booking: booking, employee: employee, payType: payType, payDate: booking.bookingDate!)
        var listBill = [Bill]()
        listBill.append(bill)
        booking.bills = NSSet.init(array: listBill)
        saveTicketsAndUpdateSeasonTour()
        BookingDAO.init().add(managedObject: booking)
        BillDAO.init().add(managedObject: bill)
        
        self.dismiss(animated: false, completion: {
            self.delegate.addBookingDone()
        })
    }
    
    func saveTicketsAndUpdateSeasonTour() {
        print("saveTicketsAndUpdateSeasonTour")
        let ticketDAO = TicketDAO.init()
        let seasonTourDAO = SeasonTourDAO.init()
        for ticket in listChooseTicket {
            ticket.booking = booking
            let seasonTour = ticket.seasonTour!
            //            let totalSlot = Int(seasonTour.totalSlot) - Int(ticket.adultSlot) - Int(ticket.childrenSlot)
            //            seasonTour.totalSlot = Int16(totalSlot)
            ticketDAO.add(managedObject: ticket)
            seasonTourDAO.update(managedObject: seasonTour)
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
    
    func showAddClientVC() {
        let addClientVC = UIStoryboard.init(name: "Client", bundle: nil).instantiateViewController(withIdentifier: "AddClientViewController") as! AddClientViewController
        addClientVC.delegate = self
        addClientVC.message = "Not found"
        self.present(addClientVC, animated: false, completion: nil)
    }
    
    func returnClient(client: Client) {
        self.client = client
        showToast(message: "Client Added")
        showClientInfoView()
    }
}
