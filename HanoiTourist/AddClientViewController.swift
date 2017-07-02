
//
//  AddClientViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 7/2/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
protocol AddClientViewControllerDelegate {
    func returnClient(client: Client)
}
class AddClientViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: AddClientViewControllerDelegate!
    var message: String!
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var cardNumberTextField: UITextField!
    
    @IBOutlet weak var cardTypeTextField: UITextField!
    
    @IBAction func add(_ sender: UIButton) {
        
        let name = nameTextField.text!
        if name.characters.count == 0 {
            showToast(message: "Name field error")
            return
        }
        
        let phone = phoneTextField.text!
        if phone.characters.count == 0 {
            showToast(message: "Phone field error")
            return
        }
        
        let email = emailTextField.text!
        
        if !isValidEmail(testStr: email) {
            showToast(message: "Email field error")
            return
        }
        
        let address = addressTextField.text!
        if address.characters.count == 0 {
            showToast(message: "Address field error")
            return
        }
        
        let cardID = cardNumberTextField.text!
        if cardID.characters.count == 0 {
            showToast(message: "card number field error")
            return
        }
        
        let cardType = cardTypeTextField.text!
        if cardType.characters.count == 0 {
            showToast(message: "card Type field error")
            return
        }
        
        let client = NSManagedObjectFactory.createClientNSManagedObject(name: name, phone: phone, email: email, address: address, cardNumber: cardID, cardType: cardType)
        
        if ClientDAO.init().add(managedObject: client) {
            self.dismiss(animated: false, completion: nil)
            delegate.returnClient(client: client)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.delegate = self
        cardNumberTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if message != nil {
            showToast(message: message)
        }
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
    
    func isValidEmail(testStr:String) -> Bool {
        print("validate emilId: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,}+.[A-Za-z]{2,}"
        return testStr.range(of: emailRegEx, options: .regularExpression) != nil
        //        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        //        let result = emailTest.evaluate(with: testStr)
        //        return result
    }
}
