//
//  BillDAO.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class BookingDAO: DAO {
    
    override var entityName: String {
        return "Booking"
    }
    
    let id = "id"
    let totalSlot = "totalSlot"
    let price = "price"
    let bookingDate = "bookingDate"
    
    override func getAll() -> [NSManagedObject]? {
        print("getAllBookingData")
        do {
            let dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                print(data.value(forKey: totalSlot) as? Int16 ?? "nil")
                print(data.value(forKey: bookingDate) as? NSDate ?? "nil")
                print((data as! Booking).client!.name!)
            }
            return dataArray
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
    
    override func add(managedObject: NSManagedObject) -> Bool {
        print("Add Booking")
        return super.add(managedObject: managedObject)
    }
}

