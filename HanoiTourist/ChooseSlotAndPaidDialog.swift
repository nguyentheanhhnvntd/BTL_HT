//
//  ChooseSlotAndPaidDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/28/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol ChooseSlotAndPaidDialogDelegate {
    func comfirm(ticket: Ticket)
}

class ChooseSlotAndPaidDialog: UIViewController, UITextFieldDelegate {
    
    var ticket: Ticket!
    var delegate: ChooseSlotAndPaidDialogDelegate!
    
    @IBAction func confirmed(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        delegate.comfirm(ticket: ticket)
    }
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }

    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var childrenSlotTextField: UITextField!
    @IBOutlet weak var adultSlotTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        childrenSlotTextField.delegate = self
        adultSlotTextField.delegate = self
        adultSlotTextField.becomeFirstResponder()
        
        childrenSlotTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        adultSlotTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

    }
    
    func textFieldDidChange(_ textField: UITextField) {
        var money: Double = 0
        if let adult = Int(adultSlotTextField.text!) {
            money += Double(adult) * ticket.seasonTour!.price
            ticket.adultSlot = Int16.init(exactly: adult)!
        }
        if let children = Int(childrenSlotTextField.text!) {
            money += Double(children) * ticket.seasonTour!.price / 2
            ticket.childrenSlot = Int16.init(exactly: children)!
        }
        totalPrice.text = "\(money) vnd"
        ticket.price = money
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if text.characters.count == 0 {
            return true
        }
        if Int.init(text) != nil {
            return true
        } else {
            return false
        }
    }
    
}
