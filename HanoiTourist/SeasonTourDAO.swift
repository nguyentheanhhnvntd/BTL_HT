//
//  SeasonTourDAO.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/26/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class SeasonTourDAO: DAO {
    
    override var entityName: String {
        return "SeasonTour"
    }
    
    let id = "id"
    let start = "start"
    let end = "end"
    let totalSlot = "totalSlot"
    let price = "price"
    let des = "des"
    
    override func getAll() -> [NSManagedObject]? {
        print("getAllSeasonTourData")
        do {
            let dataArray = try appDelegateManagerObjectContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in dataArray {
                print(data.value(forKey: id) as? Int ?? "nil id")
                print(data.value(forKey: start) as? Date ?? "nil start")
                print(data.value(forKey: end) as? Date ?? "nil end")
                print(data.value(forKey: totalSlot) as? Int ?? "nil totalSlot")
                print(data.value(forKey: price) as? Double ?? "nil price")
                print(data.value(forKey: des) as? String ?? "nil des")
                print((data as! SeasonTour).tour?.to)
            }
            
            return dataArray
        } catch {
            let fetchError = error as NSError
            print(fetchError)
            return nil
        }
    }
    
    func findBy(startPlace: String, endPlace: String) -> [SeasonTour] {
        let list = getAll()! as! [SeasonTour]
        print(list.count)
        return list.filter({
            return $0.tour!.from!.contains(startPlace) && $0.tour!.to!.contains(endPlace)
        })
    }
}

