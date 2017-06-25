//
//  TourDAO.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class TourDAO: DAO {
    
    override var entityName: String {
        return "Tour"
    }
    
    let id = "id"
    let from = "from"
    let to = "to"
    let des = "des"
    
    override func getAll() -> [NSManagedObject]? {
        print("getAllCompanyData")
        do {
            let dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                print(data.value(forKey: from) as? String ?? "nil from")
                print(data.value(forKey: to) as? String ?? "nil to")
                print(data.value(forKey: des) as? String ?? "nil des")
            }

            return dataArray
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
}
