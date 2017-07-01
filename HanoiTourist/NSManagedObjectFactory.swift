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
    
    static func createBillNSManagedObject() -> Bill {
        entityDescription = NSEntityDescription.entity(forEntityName: "Bill", in: appDelegateManagerObjectContext)
        return NSManagedObject(entity: entityDescription!, insertInto: appDelegateManagerObjectContext) as! Bill
    }
    
    static func createBillNSManagedObject(booking: Booking, employee: Employee, payType: String, payDate: NSDate) -> Bill {
        let bill = createBillNSManagedObject()
        bill.booking = booking
        bill.employee = employee
        bill.payType = payType
        bill.payDate = payDate
        return bill
    }
    
    static func createBookingNSManagedObject() -> Booking {
        entityDescription = NSEntityDescription.entity(forEntityName: "Booking", in: appDelegateManagerObjectContext)
        return NSManagedObject(entity: entityDescription!, insertInto: appDelegateManagerObjectContext) as! Booking
    }
    
    static func createBookingNSManagedObject(listTicket: [Ticket], client: Client) -> Booking {
       
        let booking = createBookingNSManagedObject()
        
        booking.tickets = NSSet(array: listTicket)
        booking.client = client
        var slot = 0
        for ticket in listTicket {
            slot += Int(ticket.adultSlot) + Int(ticket.childrenSlot)
        }
        booking.totalSlot = Int16.init(slot)
        return booking
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
    
    static func createTicketNSManagedObject(seasonTour: SeasonTour) -> Ticket {
        entityDescription = NSEntityDescription.entity(forEntityName: "Ticket", in: appDelegateManagerObjectContext)
        let ticket = NSManagedObject(entity: entityDescription!, insertInto: appDelegateManagerObjectContext) as! Ticket
        ticket.seasonTour = seasonTour
        return ticket
    }
    
    static func createSeasonTourNSManagedObject() -> SeasonTour {
        entityDescription = NSEntityDescription.entity(forEntityName: "SeasonTour", in: appDelegateManagerObjectContext)
        return NSManagedObject(entity: entityDescription!, insertInto: appDelegateManagerObjectContext) as! SeasonTour
    }
}
