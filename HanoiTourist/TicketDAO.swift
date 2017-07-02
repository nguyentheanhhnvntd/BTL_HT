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
    let adultSlot = "adultSlot"
    let price = "price"
    let childrenSlot = "childrenSlot"
    
    override func getAll() -> [NSManagedObject]? {
        print("getAllCompanyData")
        do {
            var dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [Ticket]
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                print(data.value(forKey: adultSlot) as? Int ?? "nil")
                print(data.value(forKey: price) as? Double ?? "nil")
                print(data.value(forKey: childrenSlot) as? Int ?? "nil")
            }
            dataArray = dataArray.filter({
                $0.price > 0 && $0.booking != nil
            })
            return dataArray
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
    
//    override func add(managedObject: NSManagedObject) -> Bool {
//        print("Add Ticket")
//        let ticket = managedObject as! Ticket
//        print(ticket.booking!.bookingDate)
//        return super.add(managedObject: managedObject)
//    }
}
