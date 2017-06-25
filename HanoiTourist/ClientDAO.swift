//
//  ClientDAO.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class ClientDAO: DAO {
    
    override var entityName: String {
        return "Client"
    }
    
    let id = "id"
    let name = "name"
    let address = "address"
    let mail = "mail"
    let phone = "phone"
    
    override func getAll() -> [NSManagedObject]? {
        print("getAllCompanyData")
        do {
            let dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                print(data.value(forKey: name) as? String ?? "nil")
                print(data.value(forKey: address) as? String ?? "nil")
                print(data.value(forKey: mail) as? String ?? "nil")
                print((data as! Client).memberCard!.cardType!)
            }
            return dataArray
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
}
