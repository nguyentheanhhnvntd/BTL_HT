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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showClient()
    }
    
    func showClient(){
        let clientVC = UIStoryboard.init(name: "Client", bundle: nil).instantiateInitialViewController()!
        
        self.present(clientVC, animated: false, completion: nil)
    }
}

