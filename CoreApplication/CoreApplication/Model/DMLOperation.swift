//
//  DMLOperation.swift
//  CoreApplication
//
//  Created by mr.jb on 16/04/23.
//

import UIKit
import CoreData

class DMLOperation: NSObject {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func savedata(data:[String:Any])
    {
        let saveInfo = NSEntityDescription.insertNewObject(forEntityName: "Candidate", into: context) as! Candidate
        saveInfo.name = data["name"] as? String
        saveInfo.email = data["email"] as? String
        saveInfo.password = data["password"] as? String
        saveInfo.city = data["city"] as? String
        saveInfo.birthdate = data["birthdate"] as? String
    }
    
    func showdata()->[Candidate]
    {
        var stdata = [Candidate]()
        let req = NSFetchRequest<NSManagedObject>.init(entityName: "Candidate")
        do
        {
            stdata = try context.fetch(req) as! [Candidate]
        }
        catch
        {
            print(error.localizedDescription)
        }
        return stdata
    }
    
    func deletedata(index:Int)->[Candidate]
    {
        var stdata = showdata()
        context.delete(stdata[index])
        stdata.remove(at: index)
        do
        {
            try context.save()
        }
        catch
        {
            print(error.localizedDescription)
        }
        return stdata
    }
}
