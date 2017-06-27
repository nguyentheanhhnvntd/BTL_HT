//
//  CompanyDAO.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class CompanyDAO: DAO {
    
    override var entityName: String {
        return "Company"
    }
    
    let id = "id"
    let address = "address"
    let name = "name"
    let rating = "rating"
    let des = "des"
    let owner = "owner"
    let phonenum = "phonenum"
    
    override init() {
        super.init()
    }
    
    override func getAll() -> [NSManagedObject]? {
        print("getAllCompanyData")
        do {
            let dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                print(data.value(forKey: address) as? String ?? "nil address")
                print(data.value(forKey: name) as? String ?? "nil name")
                print(data.value(forKey: rating) as? Int ?? "nil rating")
                print(data.value(forKey: des) as? String ?? "nil des")
                print(data.value(forKey: owner) as? String ?? "nil owner")
                print(data.value(forKey: phonenum) as? String ?? "nil des")
            }
            var mo = [Company]()
            mo.append(dataArray.first as! Company)
            return mo
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
}
