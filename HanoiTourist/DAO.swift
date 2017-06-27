//
//  DAO.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class DAO: DAOProtocol {
    
    var appDelegateManagerObjectContext : NSManagedObjectContext!
    var fetchRequest = NSFetchRequest<NSFetchRequestResult>()
    var entityDescription: NSEntityDescription!
    var entityName: String {
        return "entityName"
    }
    
    init() {
        appDelegateManagerObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        entityDescription = NSEntityDescription.entity(forEntityName: entityName, in: appDelegateManagerObjectContext)
        fetchRequest.entity = entityDescription
        print(entityName)
    }
    
    func getAll() -> [NSManagedObject]? {
        fatalError()
    }
    
    func add(managedObject: NSManagedObject) -> Bool {
        print("add")
        do {
            try managedObject.managedObjectContext?.save()
            print("add added")
            return true
        } catch {
            print("Error occured during save entity")
            print(error)
            return false
        }
    }
    
    func update(managedObject: NSManagedObject) -> Bool {
        print("update")
        do {
            try managedObject.managedObjectContext?.save()
            print("update updated")
            return true
        } catch {
            print("Error occured during update entity")
            return false
        }
    }
    
    func delete(managedObject: NSManagedObject) -> Bool {
        print("delete")
        appDelegateManagerObjectContext.delete(managedObject)
        do {
            try appDelegateManagerObjectContext.save()
            print("deleted")
            return true
        } catch {
            print("Error occured during delete entity")
            return false
        }
    }
}
