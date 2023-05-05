//
//  SecondViewController.swift
//  API_Get_POST
//
//  Created by Jahangir Bavra on 05/04/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var txt_comment: UITextField!
    @IBOutlet weak var txt_info: UITextField!
    @IBOutlet weak var txt_date: UITextField!
    @IBOutlet weak var txt_name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func select_date(_ sender: UIDatePicker)
    {
        let dt=sender.date
        let dtfrm=DateFormatter()
        dtfrm.dateFormat="yyyy-MM-dd"
        txt_date.text=dtfrm.string(from: dt)
    }
    
   
    @IBAction func btn_save(_ sender: Any)
    {
        postdata()
    
    }
    
    
    func postdata()
    {
        let param:[String:Any]=[
            "event_name":txt_name.text!,
            "event_time":txt_date.text!,
            "event_information":txt_info.text!,
            "comments":txt_comment.text!
        ]
        
        let url=URL(string: "https://cloudrestapi.pythonanywhere.com/adddata/")
       
         // create the session object
         let session = URLSession.shared
         
         // now create the URLRequest object using the url object
        var request = URLRequest(url: url!)
         request.httpMethod = "POST" //set http method as POST
         
         // add headers for the request
         request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
         request.addValue("application/json", forHTTPHeaderField: "Accept")
         
         do {
           // convert parameters to Data and assign dictionary to httpBody of request
           request.httpBody = try JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
         } catch let error {
           print(error.localizedDescription)
           return
         }
         
         // create dataTask using the session object to send data to the server
         let task = session.dataTask(with: request) { data, response, error in
           
           if let error = error {
             print("Post Request Error: \(error.localizedDescription)")
             return
           }
           
        /*   // ensure there is valid response code returned from this HTTP response
           guard let httpResponse = response as? HTTPURLResponse,
                 (200...299).contains(httpResponse.statusCode)
           else {
             print("Invalid Response received from the server")
             return
           } */
           
           // ensure there is data returned
           guard let responseData = data else {
             print("nil Data received from the server")
             return
           }
           
           do {
             // create json object from data or use JSONDecoder to convert to Model stuct
             if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
               print(jsonResponse)
               // handle json response
             } else {
               print("data maybe corrupted or in wrong format")
               throw URLError(.badServerResponse)
             }
           } catch let error {
             print(error.localizedDescription)
           }
         }
         // perform the task
         task.resume()
        
    }
        
}
