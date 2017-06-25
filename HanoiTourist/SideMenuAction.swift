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
    
    static func showClient(currentViewController: UIViewController){
        let clientVC = UIStoryboard.init(name: "Client", bundle: nil).instantiateInitialViewController()!
        currentViewController.dismiss(animated: false, completion: nil)
        currentViewController.present(clientVC, animated: true, completion: nil)
    }
    
    static func showCompanyInfo(currentViewController: UIViewController){
        let companyInfoVC = UIStoryboard.init(name: "Company", bundle: nil).instantiateInitialViewController()!
        currentViewController.dismiss(animated: false, completion: nil)
        currentViewController.present(companyInfoVC, animated: true, completion: nil)
    }
    
}
