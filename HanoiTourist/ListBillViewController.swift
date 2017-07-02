//
//  ListBillViewController.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 7/1/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class ListBillViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var listBill: [Bill]!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func showSideMenu(_ sender: UIButton) {
        SidemenuAction.showSideMenu(currentViewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BillTableViewCell", bundle: nil), forCellReuseIdentifier: "BillTableViewCell")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listBill = BillDAO.init().getAll()! as! [Bill]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listBill.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 124
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BillTableViewCell") as! BillTableViewCell
        
        let bill = listBill[indexPath.row]
        
        var date = String(describing: bill.payDate!)
        date = date.substring(to: date.index(date.startIndex, offsetBy: 19))
        cell.billDate.text = date
        cell.client.text = "Client: " + (bill.booking?.client?.name)!
        cell.employee.text = "Employee: " + (bill.employee?.name)!
        cell.slot.text = "Total slot: \(Int((bill.booking?.totalSlot)!))"
        cell.payType.text = "Pay by \(bill.payType!)"
        return cell
    }
}
