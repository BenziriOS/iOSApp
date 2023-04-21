//
//  ViewController.swift
//  CoreApplication
//
//  Created by mr.jb on 16/04/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var namr: UITextField!
    @IBOutlet var password: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(path)
        
        fetch()
    }
    
    func fetch()
    {
        let fetchRequest: NSFetchRequest<Candidate> = Candidate.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", namr.text!)
               
               do {
                   let users = try context.fetch(fetchRequest)
                   if let user = users.first, user.password == password.text , user.name == namr.text {
                       // User logged in successfully
                   } else {
                       // Invalid email or password
                   }
               } catch {
                   print("Error fetching user: \(error)")
               }
    }

    @IBAction func loginAction(_ sender: Any) {
        let HomeViewController = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(HomeViewController, animated: true)
    }
    
    @IBAction func signupAction(_ sender: Any) {
        let signupViewController = storyboard?.instantiateViewController(withIdentifier: "signupViewController") as! signupViewController
        navigationController?.pushViewController(signupViewController, animated: true)
    }
}

