//
//  ListClientContainerDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/29/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol ListClientContainerDialogDelegate {
    func choose(client: Client)
}
class ListClientContainerDialog: UIViewController, ListClientDialogDelegate {

    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    var listClient: [Client]!
    var delegate: ListClientContainerDialogDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showClientDialog" {
            let des = segue.destination as! ListClientDialog
            des.listClient = listClient
            des.delegate = self
        }
    }
 
    func choose(client: Client) {
        self.dismiss(animated: false, completion: nil)
        delegate.choose(client: client)
    }
}
