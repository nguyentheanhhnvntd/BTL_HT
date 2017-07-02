//
//  InitDefaultDatabase.swift
//  HanoiTourist
//
//  Created by Thế Anh Nguyễn on 6/25/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit
import CoreData

class InitDefaultDatabase{
    
    static func addSeasonTour() {
        
        let tours = TourDAO.init().getAll()! as! [Tour]
        let seasonTourDAO = SeasonTourDAO.init()
        for i in 0...tours.count - 1 {
            let seasonTour = NSManagedObjectFactory.createSeasonTourNSManagedObject()
            seasonTour.setValue(i, forKey: "id")
            seasonTour.tour = tours[i]
            seasonTour.setValue(100, forKey: "totalSlot")
            let dur = tours[i].duration!
            let currentDate = Date.init(timeIntervalSinceNow: 0)
            let (day, _) = Util.convertDuration(duration: dur)
            seasonTour.setValue(day * 900000, forKey: "price")
            seasonTour.setValue(currentDate, forKey: "start")
            let end = Calendar.current.date(byAdding: .day, value: day, to: currentDate)!
            seasonTour.setValue(end, forKey: "end")
            seasonTour.setValue("Wonderful, craziest, unforgettable journey", forKey: "des")
            seasonTourDAO.add(managedObject: seasonTour)
        }
    }
    
    static func addClientInfo() {
        
        let client = NSManagedObjectFactory.createClientNSManagedObject()
        client.setValue(1, forKey: "id")
        client.setValue("043 795 9900", forKey: "phone")
        client.setValue("số 78 phố Duy Tân, Phường Dịch Vọng Hậu, Quận Cầu Giấy, Hà Nội", forKey: "address")
        client.setValue("Ms. Hoàng Thị Tố Nga", forKey: "name")
        client.setValue("nga@dw.com.vn", forKey: "email")
        client.setValue("Customer is GOD!", forKey: "des")
        client.cardID = "\(Int(client.id) + 100)"
        client.cardType = "Silver"
        ClientDAO.init().add(managedObject: client)
        
        let client1 = NSManagedObjectFactory.createClientNSManagedObject()
        client1.setValue(2, forKey: "id")
        client1.setValue("043 730 1945", forKey: "phone")
        client1.setValue("74 Nguyễn Khánh Toàn, Quận Cầu Giấy, Hà Nội", forKey: "address")
        client1.setValue("Mr. Hoàng Thanh Nghi", forKey: "name")
        client1.setValue("nghi@ben.com.vn", forKey: "email")
        client1.setValue("Customer is GOD!", forKey: "des")
        client1.cardID = "\(Int(client1.id) + 100)"
        client1.cardType = "Silver"
        ClientDAO.init().add(managedObject: client1)
        
        let client2 = NSManagedObjectFactory.createClientNSManagedObject()
        client2.setValue(3, forKey: "id")
        client2.setValue("094 922 6004", forKey: "phone")
        client2.setValue("số 204 phố Hoàng Ngân, Phường Trung Hoà, Quận Cầu Giấy, Thành phố Hà Nội", forKey: "address")
        client2.setValue("Ms. Trần Thị Tuyết", forKey: "name")
        client2.setValue("tuyet@ss.com.vn", forKey: "email")
        client2.setValue("Customer is GOD!", forKey: "des")
        client2.cardID = "\(Int(client2.id) + 100)"
        client2.cardType = "Silver"
        ClientDAO.init().add(managedObject: client2)
        
        let client3 = NSManagedObjectFactory.createClientNSManagedObject()
        client3.setValue(4, forKey: "id")
        client3.setValue("093 684 1843", forKey: "phone")
        client3.setValue("ngõ 219 Trung Kính, tổ 49, Phường Yên Hoà, Quận Cầu Giấy, Thành phố Hà Nội", forKey: "address")
        client3.setValue("Mr. Bùi Hồng Hiển", forKey: "name")
        client3.setValue("hien@tc.com.vn", forKey: "email")
        client3.setValue("Customer is GOD!", forKey: "des")
        client3.cardID = "\(Int(client3.id) + 100)"
        client3.cardType = "Silver"
        ClientDAO.init().add(managedObject: client3)
    }
    
    static func addEmployeeInfo() {
        let employee = NSManagedObjectFactory.createEmployeeNSManagedObject()
        employee.setValue(1, forKey: "id")
        employee.setValue("0123 2203 194", forKey: "phone")
        employee.setValue("1st Lac Long Quan street, Nghia Do ward, Cau Giay district, Hanoi city", forKey: "address")
        employee.setValue("Mr. Nguyen The Anh", forKey: "name")
        employee.setValue("anh@ht.com.vn", forKey: "email")
        employee.setValue("CEO", forKey: "position")
        employee.setValue("anhnt", forKey: "username")
        employee.setValue("hanoi", forKey: "password")
        employee.setValue("Stay hungry, stay foolish!", forKey: "des")
        EmployeeDAO.init().add(managedObject: employee)
        
        let employee1 = NSManagedObjectFactory.createEmployeeNSManagedObject()
        employee1.setValue(2, forKey: "id")
        employee1.setValue("0978 135 401", forKey: "phone")
        employee1.setValue("1st Hoang Quoc Viet street, Nghia Do ward, Cau Giay district, Hanoi city", forKey: "address")
        employee1.setValue("Mr. Nguyen Quang Vinh", forKey: "name")
        employee1.setValue("vinh@ht.com.vn", forKey: "email")
        employee1.setValue("Saleman", forKey: "position")
        employee1.setValue("vinhnq", forKey: "username")
        employee1.setValue("hanoi", forKey: "password")
        employee1.setValue("Never give up!", forKey: "des")
        EmployeeDAO.init().add(managedObject: employee1)
        
        let employee2 = NSManagedObjectFactory.createEmployeeNSManagedObject()
        employee2.setValue(3, forKey: "id")
        employee2.setValue("0124 435 2068", forKey: "phone")
        employee2.setValue("191 Lac Long Quan street, Nghia Do ward, Cau Giay district, Hanoi city", forKey: "address")
        employee2.setValue("Mr. Tran Bao Thanh", forKey: "name")
        employee2.setValue("thanh@ht.com.vn", forKey: "email")
        employee2.setValue("Saleman", forKey: "position")
        employee2.setValue("thanhtb", forKey: "username")
        employee2.setValue("hanoi", forKey: "password")
        employee2.setValue("Never give up!", forKey: "des")
        EmployeeDAO.init().add(managedObject: employee2)
        
        let employee3 = NSManagedObjectFactory.createEmployeeNSManagedObject()
        employee3.setValue(4, forKey: "id")
        employee3.setValue("0165 599 3161", forKey: "phone")
        employee3.setValue("3rd Lac Long Quan street, Nghia Do ward, Cau Giay district, Hanoi city", forKey: "address")
        employee3.setValue("Mr. Nguyen Duc Quan", forKey: "name")
        employee3.setValue("quan@ht.com.vn", forKey: "email")
        employee3.setValue("Saleman", forKey: "position")
        employee3.setValue("quannd", forKey: "username")
        employee3.setValue("hanoi", forKey: "password")
        employee3.setValue("Never give up!", forKey: "des")
        EmployeeDAO.init().add(managedObject: employee3)
        
        let employee4 = NSManagedObjectFactory.createEmployeeNSManagedObject()
        employee4.setValue(5, forKey: "id")
        employee4.setValue("0972 619 689", forKey: "phone")
        employee4.setValue("33 Tran Thai Tong street, Dich Vong Hau ward, Cau Giay district, Hanoi city", forKey: "address")
        employee4.setValue("Mr. Nguyen Xuan Truong", forKey: "name")
        employee4.setValue("truong@ht.com.vn", forKey: "email")
        employee4.setValue("Saleman", forKey: "position")
        employee4.setValue("truongnx", forKey: "username")
        employee4.setValue("hanoi", forKey: "password")
        employee4.setValue("Never give up!", forKey: "des")
        EmployeeDAO.init().add(managedObject: employee4)
        
        let employee5 = NSManagedObjectFactory.createEmployeeNSManagedObject()
        employee5.setValue(6, forKey: "id")
        employee5.setValue("0128 211 9811", forKey: "phone")
        employee5.setValue("35 Tran Thai Tong street, Dich Vong Hau ward, Cau Giay district, Hanoi city", forKey: "address")
        employee5.setValue("Mr. Nguyen Son Tung", forKey: "name")
        employee5.setValue("tung@ht.com.vn", forKey: "email")
        employee5.setValue("Saleman", forKey: "position")
        employee5.setValue("tungns", forKey: "username")
        employee5.setValue("hanoi", forKey: "password")
        employee5.setValue("Never give up!", forKey: "des")
        EmployeeDAO.init().add(managedObject: employee5)
        
        let employee6 = NSManagedObjectFactory.createEmployeeNSManagedObject()
        employee6.setValue(7, forKey: "id")
        employee6.setValue("0979 584 909", forKey: "phone")
        employee6.setValue("37 Tran Thai Tong street, Dich Vong Hau ward, Cau Giay district, Hanoi city", forKey: "address")
        employee6.setValue("Mr. Nguyen Van Dung", forKey: "name")
        employee6.setValue("dung@ht.com.vn", forKey: "email")
        employee6.setValue("Saleman", forKey: "position")
        employee6.setValue("dungnv", forKey: "username")
        employee6.setValue("hanoi", forKey: "password")
        employee6.setValue("Never give up!", forKey: "des")
        EmployeeDAO.init().add(managedObject: employee6)
        
        let employee7 = NSManagedObjectFactory.createEmployeeNSManagedObject()
        employee7.setValue(8, forKey: "id")
        employee7.setValue("0979 58 9999", forKey: "phone")
        employee7.setValue("39 Tran Thai Tong street, Dich Vong Hau ward, Cau Giay district, Hanoi city", forKey: "address")
        employee7.setValue("Ms. Dang Thi Huong", forKey: "name")
        employee7.setValue("huong@ht.com.vn", forKey: "email")
        employee7.setValue("Saleman", forKey: "position")
        employee7.setValue("huongdt", forKey: "username")
        employee7.setValue("hanoi", forKey: "password")
        employee7.setValue("Never give up!", forKey: "des")
        EmployeeDAO.init().add(managedObject: employee7)
        
        let employee8 = NSManagedObjectFactory.createEmployeeNSManagedObject()
        employee8.setValue(9, forKey: "id")
        employee8.setValue("0163 343 5100", forKey: "phone")
        employee8.setValue("41 Tran Thai Tong street, Dich Vong Hau ward, Cau Giay district, Hanoi city", forKey: "address")
        employee8.setValue("Mr. Nguyen Thanh Hung", forKey: "name")
        employee8.setValue("hung@ht.com.vn", forKey: "email")
        employee8.setValue("Saleman", forKey: "position")
        employee8.setValue("hungnt", forKey: "username")
        employee8.setValue("hanoi", forKey: "password")
        employee8.setValue("Never give up!", forKey: "des")
        EmployeeDAO.init().add(managedObject: employee8)
        
        let employee9 = NSManagedObjectFactory.createEmployeeNSManagedObject()
        employee9.setValue(10, forKey: "id")
        employee9.setValue("0983 078 817", forKey: "phone")
        employee9.setValue("44 Tran Thai Tong street, Dich Vong Hau ward, Cau Giay district, Hanoi city", forKey: "address")
        employee9.setValue("Mr. Nguyen Van Hao", forKey: "name")
        employee9.setValue("hao@ht.com.vn", forKey: "email")
        employee9.setValue("Saleman", forKey: "position")
        employee9.setValue("haonv", forKey: "username")
        employee9.setValue("hanoi", forKey: "password")
        employee9.setValue("Never give up!", forKey: "des")
        EmployeeDAO.init().add(managedObject: employee9)
    }
    
    static func addTourInfo() {
        let tourDAO = TourDAO.init()
        
        let tour6 = NSManagedObjectFactory.createTourNSManagedObject()
        tour6.setValue(101, forKey: "id")
        tour6.setValue("Hanoi", forKey: "from")
        tour6.setValue("Danang", forKey: "to")
        tour6.setValue("7/6", forKey: "duration")
        tour6.setValue("Go every famous place in Danang", forKey: "des")
        tour6.company = CompanyDAO.init().getAll()![0] as? Company
        tourDAO.add(managedObject: tour6)
        
        let tour7 = NSManagedObjectFactory.createTourNSManagedObject()
        tour7.setValue(102, forKey: "id")
        tour7.setValue("Hanoi", forKey: "from")
        tour7.setValue("Nhatrang", forKey: "to")
        tour7.setValue("10/9", forKey: "duration")
        tour7.setValue("Go every famous place in Nhatrang", forKey: "des")
        tour7.company = CompanyDAO.init().getAll()![0] as? Company
        tourDAO.add(managedObject: tour7)
        
        let tour = NSManagedObjectFactory.createTourNSManagedObject()
        tour.setValue(103, forKey: "id")
        tour.setValue("Hanoi", forKey: "from")
        tour.setValue("Vungtau", forKey: "to")
        tour.setValue("7/6", forKey: "duration")
        tour.setValue("Go every famous place in Vungtau", forKey: "des")
        tour.company = CompanyDAO.init().getAll()![0] as? Company
        tourDAO.add(managedObject: tour)
        
        let tour1 = NSManagedObjectFactory.createTourNSManagedObject()
        tour1.setValue(104, forKey: "id")
        tour1.setValue("Hanoi", forKey: "from")
        tour1.setValue("Hochiminh", forKey: "to")
        tour1.setValue("5/4", forKey: "duration")
        tour1.setValue("Go every famous place in Hochiminh", forKey: "des")
        tour1.company = CompanyDAO.init().getAll()![0] as? Company
        tourDAO.add(managedObject: tour1)
        
        let tour2 = NSManagedObjectFactory.createTourNSManagedObject()
        tour2.setValue(105, forKey: "id")
        tour2.setValue("Hanoi", forKey: "from")
        tour2.setValue("Haiphong", forKey: "to")
        tour2.setValue("4/3", forKey: "duration")
        tour2.setValue("Go every famous place in Haiphong", forKey: "des")
        tour2.company = CompanyDAO.init().getAll()![0] as? Company
        tourDAO.add(managedObject: tour2)
        
        let tour3 = NSManagedObjectFactory.createTourNSManagedObject()
        tour3.setValue(106, forKey: "id")
        tour3.setValue("Hanoi", forKey: "from")
        tour3.setValue("Sapa", forKey: "to")
        tour3.setValue("5/4", forKey: "duration")
        tour3.setValue("Go every famous place in Sapa", forKey: "des")
        tour3.company = CompanyDAO.init().getAll()![0] as? Company
        tourDAO.add(managedObject: tour3)
        
        let tour4 = NSManagedObjectFactory.createTourNSManagedObject()
        tour4.setValue(107, forKey: "id")
        tour4.setValue("Hanoi", forKey: "from")
        tour4.setValue("Halong", forKey: "to")
        tour4.setValue("6/5", forKey: "duration")
        tour4.setValue("Go every famous place in Halong", forKey: "des")
        tour4.company = CompanyDAO.init().getAll()![0] as? Company
        tourDAO.add(managedObject: tour4)
        
        let tour5 = NSManagedObjectFactory.createTourNSManagedObject()
        tour5.setValue(108, forKey: "id")
        tour5.setValue("Hanoi", forKey: "from")
        tour5.setValue("Vinhphuc", forKey: "to")
        tour5.setValue("5/4", forKey: "duration")
        tour5.setValue("Go every famous place in Vinhphuc", forKey: "des")
        tour5.company = CompanyDAO.init().getAll()![0] as? Company
        tourDAO.add(managedObject: tour5)
        
    }
    
    static func addCompanyInfo() {
        let company = NSManagedObjectFactory.createCompanyNSManagedObject()
        company.setValue(1, forKey: "id")
        company.setValue("1st Dinh Tien Hoang street, Hoan Kiem district, Hanoi city", forKey: "address")
        company.setValue("Hanoi Tourist", forKey: "name")
        company.setValue(5, forKey: "rating")
        company.setValue("Mr. Nguyen The Anh", forKey: "owner")
        company.setValue("0123 2203 194", forKey: "phonenum")
        company.setValue("Vietnam's number one Tourist company!!!", forKey: "des")
        CompanyDAO.init().add(managedObject: company)
    }
    
}
