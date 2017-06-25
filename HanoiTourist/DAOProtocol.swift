//
//  DAOProtocol.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/23/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

protocol DAOProtocol {

    func add(managedObject: NSManagedObject) -> Bool
    func update(managedObject: NSManagedObject) -> Bool
    func delete(managedObject: NSManagedObject) -> Bool
    func getAll() -> [NSManagedObject]?

}
