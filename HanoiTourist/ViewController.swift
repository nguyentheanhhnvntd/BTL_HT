//
//  ViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/20/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
//        createDefaultInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        showInfo()
        showBooking()
    }
    
    func showInfo(){
//        CompanyDAO.init().getAll()
//        TourDAO.init().getAll()
//        SeasonTourDAO.init().getAll()
//        ClientDAO.init().getAll()
//        EmployeeDAO.init().getAll()
    }
    
    func showBooking() {
        SidemenuAction.showBooking(currentViewController: self)
    }
    
    func createDefaultInfo() {
        InitDefaultDatabase.addCompanyInfo()
        InitDefaultDatabase.addTourInfo()
        InitDefaultDatabase.addSeasonTour()
        InitDefaultDatabase.addClientInfo()
        InitDefaultDatabase.addEmployeeInfo()
    }
}

