//
//  BillDAO.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class BillDAO: DAO {
    
    override var entityName: String{
        return "Bill"
    }
    
    let id = "id"
    let note = "note"
    let payType = "payType"
    let payDate = "payDate"
    
    override func getAll() -> [NSManagedObject]? {
        print("getAllCompanyData")
        do {
            let dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                print(data.value(forKey: note) as? String ?? "nil")
                print(data.value(forKey: payType) as? String ?? "nil")
                print(data.value(forKey: payDate) as? Date ?? "nil")
                print((data as! Bill).employee!.name!)
                print((data as! Bill).booking!.client!.name!)
            }
            return dataArray
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
}

