//
//  ConfirmSaveBookingDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 7/1/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
protocol ConfirmSaveBookingDialogDelegate {
    func payRightNow(payType: String)
    func payLater()
}
class ConfirmSaveBookingDialog: UIViewController, ChoosePayTypeDialogDelegate {
    
    var delegate: ConfirmSaveBookingDialogDelegate!
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }

    @IBAction func payRightNow(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
        showChoosePayTypeDialog()
    }
    @IBAction func payLater(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
        delegate.payLater()
    }
    var booking: Booking!
    @IBOutlet weak var totalPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let list = booking.tickets?.allObjects as! [Ticket]
        var price: Double = 0
        for ticket in list {
            print("\(ticket.price)" + " VNDDD")
            price += ticket.price
        }
        totalPrice.text = "\(price) vnd"
    }
    
    func showChoosePayTypeDialog() {
        let choosePayTypeDialogVC = UIStoryboard.init(name: "Booking", bundle: nil).instantiateViewController(withIdentifier: "ChoosePayTypeDialog") as! ChoosePayTypeDialog
        choosePayTypeDialogVC.delegate = self
        choosePayTypeDialogVC.modalPresentationStyle = .overCurrentContext
        self.present(choosePayTypeDialogVC, animated: false, completion: nil)
    }
    
    func payByBanking() {
        delegate.payRightNow(payType: "Banking")
    }
    
    func payByCash() {
        delegate.payRightNow(payType: "Cash")
    }
}
