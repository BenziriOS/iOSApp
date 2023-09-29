//
//  DBManager.swift
//  FMDBDemo
//
//  Created by Hashone 21 on 14/09/23.
//

import UIKit

class DBManager: NSObject {

    static let shared:DBManager = DBManager()
    
    let databaseFileName = "fmdb.sqlite"
    var pathToDatabse:String!
    var database:FMDatabase!
    
    override init() {
        super.init()

        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString)as String
        pathToDatabse = documentsDirectory.appending("/\(databaseFileName)")
    
        createDatabase()
    }
    
    //MARK
    //MARK: Create Table

    func createDatabase() -> Bool {
        var created = false
        
        if !FileManager.default.fileExists(atPath: pathToDatabse){
            database = FMDatabase(path: pathToDatabse!)
            
            if database != nil{
                print("database not nill")
                
                if database.open(){
                  
                    let createTable = "create table if not exists person (Id Integer Primary Key AutoIncrement, Name Text, Age Integer, Dob Text)"

                    do{
                        try database.executeUpdate(createTable, values: nil)
                        created = true
                        print("Table created successfully")
                    }catch{
                        print("could not Create Table")
                        print(error.localizedDescription)
                    }
                    database.close()
                }else{
                    print("could not open the databse")
                }
            }
        }
        return created
    }
    
    //MARK
    //MARK: Open database
    func openDatabase() -> Bool {
        if database == nil{
            if FileManager.default.fileExists(atPath: pathToDatabse){
                database = FMDatabase(path: pathToDatabse)
               
            }
        }
        if database != nil{
            if database.open(){
               
                return true
            }
        }
        return false
    }
    
    func insertData(name:String, age:Int, dob:String) {

        let name = name
        let age = age
        let dob = dob
       
        if openDatabase(){
            do{
                let query = "insert into person(Name, Age, Dob) values ('\(name)',\(age), '\(dob)')"
                if !database.executeStatements(query){
                    print(database.lastError(),database.lastErrorMessage())
                    
                }else{
                    print("Record Inserted")
                }
            }
            catch{
                print("Record Not Inserted \(error.localizedDescription)")
            }
            database.close()
        }
    }
    
    
    //MARK
    //MARK: Select Table
    func loadStudentData() -> [studentInfo]! {
        var students: [studentInfo]!
        
        if openDatabase(){
            let query = "select Id,Name,Age,Dob from person"
            do{
              
                let results = try database.executeQuery(query, values: nil)
              
                
                while results.next() {
                    let studentData = studentInfo(id: Int(results.int(forColumn: "Id")), name: String(results.string(forColumn: "Name") ?? ""), age: Int(results.int(forColumn: "Age")), dob: String(results.string(forColumn: "Dob") ?? ""))
                  
                    
                    if students == nil{
                        students = [studentInfo]()
                    }
                    students.append(studentData)
                }
            }
            catch{
                print("Don't Return Records",error.localizedDescription)
            }

            database.close()
        }
        return students
    }
    
    //MARK
    //MARK: Update Table
    func updateStudentRecord(id:Int, name:String, age:Int, dob:String) {
        
        if openDatabase(){
            let updateRecord = "update person set id = ?, name = ?, age = ?, dob = ? where id = \(id)"
            do{
                try database.executeUpdate(updateRecord, values: [id,name,age,dob])
                print("Record update Successfully")
            }catch{
                
                print("Error in Update",error.localizedDescription)
            }
            database.close()
        }
    }
    
    //MARK
    //MARK: Delete Table
    func deleteStudentRecord(id:Int) -> Bool{
        var delete = false
        if openDatabase(){
            let query = "delete from person where id = ?"
            do{
                try database.executeUpdate(query, values: [id])
                delete = true
                print("Record Deleted Successfully")
            }
            catch{
                print("Error in Delete Record \(error.localizedDescription)")
            }
            database.close()
        }
        return delete
    }
}
