//
//  SideMenuTableViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {
    
    var currentVC: UIViewController!
    
    @IBAction func showCompanyInfo(_ sender: UIButton) {
//        self.dismiss(animated: false, completion: nil)
        SidemenuAction.showCompanyInfo(currentViewController: self.currentVC)
    }
    
    @IBOutlet weak var userInfo: UILabel!
    @IBOutlet weak var booking: UILabel!
    @IBOutlet weak var bill: UILabel!
    @IBOutlet weak var client: UILabel!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var tour: UILabel!
    @IBOutlet weak var ticket: UILabel!
    @IBOutlet weak var seasonTour: UILabel!
    @IBOutlet weak var setting: UILabel!
    @IBAction func logout(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignActionToLabel()
        checkCurrentVC()
    }
    
    private func assignActionToLabel(){
        userInfo.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(showUserInfo)))
        booking.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(showBooking)))
        bill.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(showBill)))
        client.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(showClient)))
        user.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(showUser)))
        tour.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(showTour)))
        ticket.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(showTicket)))
        seasonTour.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(showSeasonTour)))
        setting.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(showSetting)))
    }
    
    private func checkCurrentVC(){
        if currentVC is ListClientViewController {
            client.backgroundColor = UIColor.lightGray
        }
    }
    
    func showUserInfo(){
        
    }
    func showBooking(){
        SidemenuAction.showBooking(currentViewController: self.currentVC)
    }
    func showBill(){
        SidemenuAction.showBill(currentViewController: self.currentVC)
    }
    func showClient(){
        SidemenuAction.showClient(currentViewController: self.currentVC)
        
    }
    func showUser(){
//        SidemenuAction.showEmployee(currentViewController: currentVC)
    }
    func showTour(){
//        SidemenuAction.showTour(currentViewController: currentVC)
    }
    func showTicket(){
        SidemenuAction.showTicket(currentViewController: currentVC)
    }
    func showSeasonTour(){
        SidemenuAction.showSeasonTour(currentViewController: currentVC)
    }
    func showSetting(){
        
    }
}
