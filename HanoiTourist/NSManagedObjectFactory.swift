//
//  NSManagedObjectFactory.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/25/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class NSManagedObjectFactory {
    
    static let appDelegateManagerObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static let fetchRequest = NSFetchRequest<NSFetchRequestResult>()
    static var entityDescription: NSEntityDescription!
    
    static func createCompanyNSManagedObject() -> Company {
        entityDescription = NSEntityDescription.entity(forEntityName: "Company", in: appDelegateManagerObjectContext)
        return NSManagedObject(entity: entityDescription!, insertInto: appDelegateManagerObjectContext) as! Company
    }
    
    static func createTourNSManagedObject() -> Tour {
        entityDescription = NSEntityDescription.entity(forEntityName: "Tour", in: appDelegateManagerObjectContext)
        return NSManagedObject(entity: entityDescription!, insertInto: appDelegateManagerObjectContext) as! Tour
    }
    
    static func createMemberCardNSManagedObject() -> MemberCard {
        entityDescription = NSEntityDescription.entity(forEntityName: "MemberCard", in: appDelegateManagerObjectContext)
        return NSManagedObject(entity: entityDescription!, insertInto: appDelegateManagerObjectContext) as! MemberCard
    }
    
    static func createEmployeeNSManagedObject() -> Employee {
        entityDescription = NSEntityDescription.entity(forEntityName: "Employee", in: appDelegateManagerObjectContext)
        return NSManagedObject(entity: entityDescription!, insertInto: appDelegateManagerObjectContext) as! Employee
    }
    
    static func createClientNSManagedObject() -> Client {
        entityDescription = NSEntityDescription.entity(forEntityName: "Client", in: appDelegateManagerObjectContext)
        return NSManagedObject(entity: entityDescription!, insertInto: appDelegateManagerObjectContext) as! Client
    }
    
    static func createTicketNSManagedObject() -> Ticket {
        entityDescription = NSEntityDescription.entity(forEntityName: "Ticket", in: appDelegateManagerObjectContext)
        return NSManagedObject(entity: entityDescription!, insertInto: appDelegateManagerObjectContext) as! Ticket
    }
    
    static func createSeasonTourNSManagedObject() -> SeasonTour {
        entityDescription = NSEntityDescription.entity(forEntityName: "SeasonTour", in: appDelegateManagerObjectContext)
        return NSManagedObject(entity: entityDescription!, insertInto: appDelegateManagerObjectContext) as! SeasonTour
    }
}
