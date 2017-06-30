//
//  ListClientDialog.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/29/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class ListClientDialog: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var listClient = [Client]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ClientTableViewCell", bundle: nil), forCellReuseIdentifier: "ClientTableViewCell")
        
        let client = NSManagedObjectFactory.createClientNSManagedObject()
        client.memberCard = MemberCardDAO.init().getAll()![1] as? MemberCard
        client.name = "Nguyen The Anh"
        client.address = "81 Lac Long Quan, Cau Giay,.."
        listClient.append(client)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientTableViewCell") as! ClientTableViewCell
        
        let client = listClient[indexPath.row]
        
        cell.name.text = "\(client.name!)"
        cell.address.text = "\(client.address!)"
        cell.memberCardType.text = "\(client.memberCard!.cardType!)"
//        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listClient.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
}
