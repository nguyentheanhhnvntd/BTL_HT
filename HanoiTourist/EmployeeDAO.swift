//
//  ClientDAO.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class EmployeeDAO: DAO {
    
    override var entityName: String {
        return "Employee"
    }
    
    let id = "id"
    let name = "name"
    let address = "address"
    let email = "email"
    let phone = "phone"
    let username = "username"
    let password = "password"
    let position = "position"
    let des = "des"
    
    override func getAll() -> [NSManagedObject]? {
        print("getEmployeeData")
        do {
            let dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                print(data.value(forKey: name) as? String ?? "nil")
                print(data.value(forKey: address) as? String ?? "nil")
                print(data.value(forKey: email) as? String ?? "nil")
                print(data.value(forKey: phone) as? String ?? "nil")
                print(data.value(forKey: username) as? String ?? "nil")
                print(data.value(forKey: password) as? String ?? "nil")
                print(data.value(forKey: position) as? String ?? "nil")
                print(data.value(forKey: des) as? String ?? "nil")
            }
            return dataArray
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
}
