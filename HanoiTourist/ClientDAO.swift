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
    let email = "email"
    let phone = "phone"
    
    override func getAll() -> [NSManagedObject]? {
        print("getAllCompanyData")
        do {
            let dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                
                print(data.value(forKey: email) as? String ?? "nil")
                print((data as! Client).memberCard!.cardType!)
                print((data.value(forKey: self.name) as! String).decodeToVietnamese())
                print((data.value(forKey: self.address) as! String).decodeToVietnamese())
            }
            return dataArray
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
    
    func findBy(name: String) -> [Client] {
        let listClient = getAll()! as! [Client]
        return listClient.filter({
            $0.name!.contains(name)
        })
    }
}
