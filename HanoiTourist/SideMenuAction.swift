//
//  SideMenuAction.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/24/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class SidemenuAction {

    static func showSideMenu(currentViewController: UIViewController){
        let sideMenuVC = UIStoryboard.init(name: "SideMenu", bundle: nil).instantiateInitialViewController()!
        (sideMenuVC as! SideMenuContainerViewController).currentVC = currentViewController
        sideMenuVC.modalPresentationStyle = .overCurrentContext
        currentViewController.present(sideMenuVC, animated: false, completion: nil)
    }
    
    static func showBooking(currentViewController: UIViewController){
        let bookingVC = UIStoryboard.init(name: "Booking", bundle: nil).instantiateInitialViewController()!
        currentViewController.dismiss(animated: false, completion: nil)
        currentViewController.present(bookingVC, animated: true, completion: nil)
    }
    
    static func showClient(currentViewController: UIViewController){
        let clientVC = UIStoryboard.init(name: "Client", bundle: nil).instantiateInitialViewController()!
        currentViewController.dismiss(animated: false, completion: nil)
        currentViewController.present(clientVC, animated: true, completion: nil)
    }
    
    static func showTicket(currentViewController: UIViewController){
        let ticketVC = UIStoryboard.init(name: "Ticket", bundle: nil).instantiateInitialViewController()!
        currentViewController.dismiss(animated: false, completion: nil)
        currentViewController.present(ticketVC, animated: true, completion: nil)
    }
    
    static func showSeasonTour(currentViewController: UIViewController){
        let seasonTourVC = UIStoryboard.init(name: "SeasonTour", bundle: nil).instantiateInitialViewController()!
        currentViewController.dismiss(animated: false, completion: nil)
        currentViewController.present(seasonTourVC, animated: true, completion: nil)
    }
    
    static func showBill(currentViewController: UIViewController){
        let billVC = UIStoryboard.init(name: "Bill", bundle: nil).instantiateInitialViewController()!
        currentViewController.dismiss(animated: false, completion: nil)
        currentViewController.present(billVC, animated: true, completion: nil)
    }
    
    static func showCompanyInfo(currentViewController: UIViewController){
        let companyInfoVC = UIStoryboard.init(name: "Company", bundle: nil).instantiateInitialViewController()!
        currentViewController.dismiss(animated: false, completion: nil)
        currentViewController.present(companyInfoVC, animated: true, completion: nil)
    }
    
    static func showEmployee(currentViewController: UIViewController){
        let employeeVC = UIStoryboard.init(name: "Employee", bundle: nil).instantiateInitialViewController()!
        currentViewController.dismiss(animated: false, completion: nil)
        currentViewController.present(employeeVC, animated: true, completion: nil)
    }
    
    static func showTour(currentViewController: UIViewController){
        let tourVC = UIStoryboard.init(name: "Tour", bundle: nil).instantiateInitialViewController()!
        currentViewController.dismiss(animated: false, completion: nil)
        currentViewController.present(tourVC, animated: true, completion: nil)
    }
    
}
