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
        print("getAllCompanyData")
        do {
            let dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                print(data.value(forKey: totalSlot) as? String ?? "nil")
                print(data.value(forKey: price) as? String ?? "nil")
                print(data.value(forKey: bookingDate) as? String ?? "nil")
                print((data as! Booking).client!.name!)
            }
            return dataArray
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
}

