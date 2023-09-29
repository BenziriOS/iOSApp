//
//  SearchVC.swift
//  JustApp_Search
//
//  Created by Hashone 21 on 03/08/23.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var txtSearch: UITextField!
    
    var arrSearchData : Search?
    var search = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        txtSearch.clearButtonMode = .whileEditing
        txtSearch.addTarget(self, action: #selector(textFieldDidChange), for: UIControl.Event.editingChanged)
        
        search = txtSearch.text!
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        btnSearch.isEnabled = true
    }
    
    func searchLoveList(name : String , complition : @escaping (Result< Search ,Error>) -> Void) {
     
        let parameters: [String: Any] = [
                    "token": "Q3k4ZEVjMk55YnpnYUYyeHNMbkJ2YzNRdVptOXlMbWx1YzNSaFozSmhiUzV3WVc1dmNtRnRZUzVqWVhKdkZ5c281Nw==",
                    "t" : "dfsfs",
                    "ios_v1": "1",
                    "filter" : "active",
                    "order_by_type": "asc",
                    "order_by": "sort",
                    "limit" : "5000",
                    "page" : 1,
                    "with_content": "yes"
                    
                ]
      
      // create the url with URL
      let url = URL(string: "https://justapps.me/api/applications/searchreferences/elements/elementtags/name/love")! // change server url accordingly
      
      // create the session object
      let session = URLSession.shared
      
      // now create the URLRequest object using the url object
      var request = URLRequest(url: url)
      request.httpMethod = "POST" //set http method as POST
      
      // add headers for the request
      request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
      request.addValue("application/json", forHTTPHeaderField: "Accept")
      
      do {
        // convert parameters to Data and assign dictionary to httpBody of request
        request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
      }
      catch  {
        print(error.localizedDescription)
        return
      }
      
      // create dataTask using the session object to send data to the server
      let task = session.dataTask(with: request) { data, response, error in
        
        if let error = error {
          print("Post Request Error: \(error.localizedDescription)")
          return
        }
        
      // ensure there is valid response code returned from this HTTP response
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode)
        else {
          print("Invalid Response received from the server")
          return
        }
        
        // ensure there is data returned
        guard let responseData = data else {
          print("nil Data received from the server")
          return
        }
        
        do {
          // create json object from data or use JSONDecoder to convert to Model stuct
            let responseObject = try JSONDecoder().decode(Search.self, from: data!)
            self.arrSearchData = responseObject
           //print(self.arrSearchData)
            
            DispatchQueue.main.async {
               // self.tblCategories.reloadData()
            }
          
        }
        catch  {
          print(error.localizedDescription)
        }
      }
      // perform the task
      task.resume()
    }
    
    @IBAction func btnSearchStickerAction(_ sender: Any) {
//        if (txtSearch.text == "") {
//            let alert = UIAlertController(title: "Error", message: "Please enter text", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
//            self.present(alert, animated: true)
//        }
//
        searchLoveList(name: search) { result in                      //Use complition handler.
            switch result {
            case .success(let symbols):
                DispatchQueue.main.async {
                    self.arrSearchData = symbols
                    
                }
            case .failure(let error): print(error) // or show the error to the user
                
            }
        }
        
        
    }
    
    
}
