//
//  MemberCardDAO.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class MemberCardDAO: DAO {
    
    override var entityName: String{
        return "MemberCard"
    }
    
    let id = "id"
    let cardType = "cardType"
    let des = "des"
    
    override func getAll() -> [NSManagedObject]? {
        print("getAllMemberCardData")
        do {
            let dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                print(data.value(forKey: cardType) as? String ?? "nil address")
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
