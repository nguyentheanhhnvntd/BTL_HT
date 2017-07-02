//
//  ListClientDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/29/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

protocol ListClientDialogDelegate {
    func choose(client: Client)
}

class ListClientDialog: UIViewController, UITableViewDataSource, UITableViewDelegate, ClientTableViewCellDelegate {

    var listClient = [Client]()
    var delegate: ListClientDialogDelegate!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ClientTableViewCell", bundle: nil), forCellReuseIdentifier: "ClientTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientTableViewCell") as! ClientTableViewCell
        
        let client = listClient[indexPath.row]
        
        cell.name.text = "\(client.name!)"
        cell.address.text = "\(client.address!)"
        cell.memberCardType.text = "Card type: \(client.cardType!)"
        cell.delegate = self
        cell.client = client
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listClient.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func choose(client: Client) {
        delegate.choose(client: client)
    }
    
}
