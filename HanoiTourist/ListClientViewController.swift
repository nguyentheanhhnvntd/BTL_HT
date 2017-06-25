//
//  ListClientViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/24/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class ListClientViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    @IBAction func search(_ sender: UIButton) {
    }
    @IBOutlet weak var titleTextField: UITextField!
    @IBAction func showSideMenu(_ sender: UIButton) {
        SidemenuAction.showSideMenu(currentViewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
