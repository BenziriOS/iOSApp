//
//  ViewController.swift
//  CoreDataExam
//
//  Created by Nikunj Prajapati on 22/01/20.
//  Copyright © 2020 Nikunj Prajapati. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController
{
    
    @IBOutlet weak var emailU: UITextField!
    @IBOutlet weak var passwordU: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
     // MARK: - Login Btn Tapped
    @IBAction func LoginTapped(_ sender: Any)
    {
        let UEmail = emailU.text!
        let UPass = passwordU.text!
        
        if (UEmail == "" || UPass == "")
        {
            print("Opps...Not Saved...!")
            let alert = UIAlertController(title: "Alert", message: "Please enter EmailID and Password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appdelegate.persistentContainer.viewContext
            let req = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            req.predicate = NSPredicate(format: "email = %@", UEmail)
            
            do {
                let result = try context.fetch(req)
                
                for data in result as! [NSManagedObject] {
                    let passwordFromData = data.value(forKey: "password") as! String
                    let emailFromData = data.value(forKey: "email") as! String
                    if UPass == passwordFromData && UEmail == emailFromData
                    {
                        
                        /*let alert = UIAlertController(title: "Log in Succesfully", message: "Username : '\(emailU.text!)'\nPassword : '\(passwordU.text!)'", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            self.dismiss(animated: true, completion: nil)
                            self.emailU.text = ""
                            self.passwordU.text = ""
                            
                            
                        }
                        alert.addAction(okAction)
                        self.present(alert, animated: true, completion: nil) */
                        
                        let SignoutViewController = storyboard?.instantiateViewController(withIdentifier: "SignoutViewController") as! SignoutViewController
                        navigationController?.pushViewController(SignoutViewController, animated: true)
                        
                        
                        
                    }else{
                        let alert = UIAlertController(title: "Error", message: "Please enter valid password", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                            self.dismiss(animated: true, completion: nil)
                        }
                        alert.addAction(okAction)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            } catch let err as NSError {
                print("Could not, \(err), \(err.localizedDescription)")
            }
            
            
        }
             
        
    }
    

}

