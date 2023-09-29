//
//  ViewController.swift
//  FMDBDemo
//
//  Created by Hashone 21 on 14/09/23.
//

import UIKit

class ViewController: UIViewController,dataPassDelegate {
    
    @IBOutlet weak var txtDob: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var btnDone: UIButton!
    
    var edit = false
    var studentID:Int!
    
    //MARK
    //MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Add Data"
        _ = DBManager.shared.createDatabase()
    }
    
    override func viewWillAppear(_ animated: Bool) {

        navigationController?.isNavigationBarHidden = false
    }

    
    func passData(id: Int, name: String, age: Int, dob: String ,edit:Bool) {

        self.edit = edit
        studentID = id
        
        print("Edit in delegate \(self.edit)")
        
        if edit == true{
            txtName.text = name
            txtAge.text = String(age)
            txtDob.text = dob
        }
        else{
            txtName.text = ""
            txtAge.text = ""
            txtDob.text = ""
        }
    }
   
    //MARK
    //MARK: done button Action.
    @IBAction func btnDoneAction(_ sender: Any) {
        
        if (txtName.text == "") && (txtAge.text == "") && (txtDob.text == ""){
            let alert = UIAlertController(title: "Alert", message: "Please Enter Data.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:  { action in
              
            }))
            present(alert, animated: true, completion: nil)
        
        }
        else{
            let nextVC = navigationController?.storyboard?.instantiateViewController(withIdentifier: "StudentTableVC")as! StudentTableVC
            
            if edit == false{
                nextVC.db.insertData(name: txtName.text!, age: Int(txtAge.text!)!, dob: txtDob.text!)
            }
            else
            {
                nextVC.db.updateStudentRecord(id: studentID, name: txtName.text ?? "", age: Int(txtAge.text!)!, dob: txtDob.text ?? "")
            }
            nextVC.delegate = self
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

