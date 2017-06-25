//
//  ClientDAO.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class TicketDAO: DAO {
    
    override var entityName: String {
        return "Ticket"
    }
    
    let id = "id"
    let quantity = "quantity"
    let price = "price"
    let startDate = "startDate"
    let endDate = "endDate"
    
    override func getAll() -> [NSManagedObject]? {
        print("getAllCompanyData")
        do {
            let dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                print(data.value(forKey: quantity) as? String ?? "nil")
                print(data.value(forKey: price) as? String ?? "nil")
                print(data.value(forKey: startDate) as? Date ?? "nil")
                print(data.value(forKey: endDate) as? Date ?? "nil")
            }
            return dataArray
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
}
