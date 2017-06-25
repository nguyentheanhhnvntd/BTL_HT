//
//  SideMenuContainerViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class SideMenuContainerViewController: UIViewController {

    let animationDuration = 0.35
    var currentVC: UIViewController!
    
    @IBOutlet weak var sideMenuContainer: UIView!
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismissController()
    }
    
    func dismissController(){
        UIView.animate(withDuration: animationDuration, animations: {
            self.sideMenuContainer.frame.origin.x = -self.sideMenuContainer.frame.maxX
        }, completion:{
            bool in
            self.sideMenuContainer.isHidden = true
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGeture = UISwipeGestureRecognizer.init(target: self, action: #selector(dismissController))
        swipeGeture.direction = .left
        sideMenuContainer.addGestureRecognizer(swipeGeture)
        sideMenuContainer.frame.origin.x = -sideMenuContainer.frame.maxX
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sideMenuContainer.isHidden = false
        UIView.animate(withDuration: animationDuration, animations: {
            self.sideMenuContainer.frame.origin.x = 0
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSideMenu" {
            (segue.destination as! SideMenuTableViewController).currentVC = currentVC
        }
    }
}
