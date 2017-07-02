//
//  ListClientViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/24/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class ListClientViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listClient: [Client]!
    @IBOutlet weak var tableView: UITableView!

    @IBAction func search(_ sender: UIButton) {
    }
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBAction func showSideMenu(_ sender: UIButton) {
        SidemenuAction.showSideMenu(currentViewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ClientTableViewCell", bundle: nil), forCellReuseIdentifier: "ClientTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listClient = ClientDAO.init().getAll()! as! [Client]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientTableViewCell") as! ClientTableViewCell
        
        let client = listClient[indexPath.row]
        
        cell.name.text = "\(client.name!)"
        cell.address.text = "\(client.address!)"
        cell.memberCardType.text = "Card type: \(client.cardType!)"
//        cell.delegate = self
        cell.client = client
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listClient.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}
