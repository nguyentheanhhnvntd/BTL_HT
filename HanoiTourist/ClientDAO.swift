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
            
            let transform = "Any-Hex/Java"
            
            
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                
                print(data.value(forKey: email) as? String ?? "nil")
                print((data as! Client).memberCard!.cardType!)
                print((data.value(forKey: self.name) as! String).decodeToVietnamese())
                print((data.value(forKey: self.address) as! String).decodeToVietnamese())
//                let name = data.value(forKey: self.name) as! NSString
//                let convertedName = name.mutableCopy() as! NSMutableString
//                CFStringTransform(convertedName, nil, transform as NSString, true)
//                print("convertedName: \(convertedName)")
                
//                let address = data.value(forKey: self.address) as! NSString
//                let convertedAddress = address.mutableCopy() as! NSMutableString
//                CFStringTransform(convertedAddress, nil, transform as NSString, true)
//                print("convertedAddress: \(convertedAddress)")
            }
            return dataArray
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
}
