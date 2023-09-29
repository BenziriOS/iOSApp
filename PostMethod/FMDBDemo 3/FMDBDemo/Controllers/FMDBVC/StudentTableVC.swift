//
//  StudentTableVC.swift
//  FMDBDemo
//
//  Created by Hashone 21 on 14/09/23.
//

import UIKit

struct studentInfo {
    var id:Int!
    var name:String!
    var age:Int!
    var dob:String!

}

//MARK:
//MARK: Protocol delegate
protocol dataPassDelegate {
    
    func passData(id:Int, name:String, age:Int, dob:String, edit:Bool)
}

class StudentTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tblStudent: UITableView!
    
    var db:DBManager = DBManager()
    var student:[studentInfo] = []
    var delegate:dataPassDelegate?

    //MARK
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Student Record"
        navigationItem.hidesBackButton = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(backBtnTapped))
       
        student = db.loadStudentData()

    }
  
    //MARK
    //MARK: Button Action
    @IBAction func onClickBack(_ sender: Any) {
      
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func backBtnTapped(){
      
        delegate?.passData(id: 0, name: "", age: 0, dob: "", edit: false)
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentTableCell")as! studentTableCell
        
        cell.lblName.text = "Name: \(student[indexPath.row].name!)"
        cell.lblAge.text = "Age: \(student[indexPath.row].age!)"
        cell.lblDob.text = "DOB: \(student[indexPath.row].dob!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.passData(id: Int(student[indexPath.row].id), name: student[indexPath.row].name, age: Int(student[indexPath.row].age), dob: student[indexPath.row].dob, edit: true)
        navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            db.deleteStudentRecord(id: student[indexPath.row].id)
            student.remove(at: indexPath.row)
            tblStudent.reloadData()
        }
    }
}
