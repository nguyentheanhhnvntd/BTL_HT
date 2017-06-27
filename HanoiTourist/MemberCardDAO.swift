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
            print(dataArray.count)
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
    
    func addDefaultMemberCardInfo(){
        let mbDAO = MemberCardDAO.init()
        let memberCard = NSManagedObjectFactory.createMemberCardNSManagedObject()
        memberCard.setValue(1, forKey: "id")
        memberCard.setValue("Bronze Member", forKey: "cardType")
        memberCard.setValue("New registration.", forKey: "des")
        mbDAO.add(managedObject: memberCard)
        
        let memberCard1 = NSManagedObjectFactory.createMemberCardNSManagedObject()
        memberCard1.setValue(2, forKey: "id")
        memberCard1.setValue("Silver Member", forKey: "cardType")
        memberCard1.setValue("1 year to 3 year.", forKey: "des")
        mbDAO.add(managedObject: memberCard1)
        
        let memberCard2 = NSManagedObjectFactory.createMemberCardNSManagedObject()
        memberCard2.setValue(3, forKey: "id")
        memberCard2.setValue("Gold Member", forKey: "cardType")
        memberCard2.setValue("3 year to 10 year.", forKey: "des")
        mbDAO.add(managedObject: memberCard2)
        
        let memberCard3 = NSManagedObjectFactory.createMemberCardNSManagedObject()
        memberCard3.setValue(4, forKey: "id")
        memberCard3.setValue("Platinum Member", forKey: "cardType")
        memberCard3.setValue("10 year and above.", forKey: "des")
        mbDAO.add(managedObject: memberCard3)
    }

}
