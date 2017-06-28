//
//  ChooseSlotAndPaidDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/28/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol ChooseSlotAndPaidDialogDelegate {
    func comfirm(ticket: Ticket, paid: Bool)
}

class ChooseSlotAndPaidDialog: UIViewController, UITextFieldDelegate {
    
    var seasonTour: SeasonTour!
    var ticket: Ticket!
    var delegate: ChooseSlotAndPaidDialogDelegate!
    
    @IBAction func confirmed(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
        delegate.comfirm(ticket: ticket, paid: paiedSwitch.isOn)
    }
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }

    @IBOutlet weak var paiedSwitch: UISwitch!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var childrenSlotTextField: UITextField!
    @IBOutlet weak var adultSlotTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        childrenSlotTextField.delegate = self
        adultSlotTextField.delegate = self
        ticket = NSManagedObjectFactory.createTicketNSManagedObject()
        ticket.seasonTour = seasonTour
        
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
