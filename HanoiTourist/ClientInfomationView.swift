//
//  ClientInfomationView.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/29/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol ClientInfomationViewDelegate {
    func saveBooking()
}
class ClientInfomationView: UIView {
    
    var client: Client!
    var delegate: ClientInfomationViewDelegate!
    
    @IBAction func confirm(_ sender: UIButton) {
        delegate.saveBooking()
    }
    
    @IBOutlet weak var carType: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var name: UILabel!
    class func instanceFromNib() -> ClientInfomationView {
        return UINib(nibName: "ClientInfomationView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ClientInfomationView
    }
    
    func setInfo(){
        name.text = client.name
        phone.text = client.phone
        email.text = client.email
        address.text = client.address
        if let card = client.memberCard {
            carType.text = card.cardType
            cardNumber.text = String(describing: card.id)
        }
    }
    
}
