//
//  signupViewController.swift
//  CoreApplication
//
//  Created by mr.jb on 16/04/23.
//

import UIKit

class signupViewController: UIViewController {

    @IBOutlet var name: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var city: UITextField!
    @IBOutlet var birthdate: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let path=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        print(path)
        
    }
    
    @IBAction func sucesSignup(_ sender: Any) {
        
      save()
        
        
    }
    
    func save()
    {
        let stdata = ["name":name.text!,
                      "email":email.text!,
                      "password":password.text!,
                      "city":city.text!,
                      "birthdate":birthdate.text!]
        
        let dml = DMLOperation()
        dml.savedata(data: stdata)
        
        do
        {
            try context.save()
            let alert=UIAlertController(title: "Success", message: "Your data has been inserted!", preferredStyle: .alert)
            let ok=UIAlertAction(title: "Ok", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
            
            name.text=""
            email.text=""
            password.text=""
            city.text = ""
            birthdate.text = ""
            
            let ViewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            navigationController?.popViewController(animated: true)
        }
        catch
        {
            let alert=UIAlertController(title: "Error", message:error.localizedDescription, preferredStyle: .alert)
            let ok=UIAlertAction(title: "Ok", style: .default)
            let more=UIAlertAction(title: "MORE", style: .destructive)
            alert.addAction(ok)
            alert.addAction(more)
            present(alert, animated: true)
        }
    }
}
