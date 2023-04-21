//
//  ViewController.swift
//  Search_TableView
//
//  Created by MAC on 18/03/23.
//

import UIKit

class ViewController: UIViewController  , UITextFieldDelegate , UITableViewDelegate , UITableViewDataSource{
   
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var contentTableView: UITableView!
   
    var data = [[String:Any]]()
    var storeArray = [[String:Any]]()
    var searching:Bool = false
    var search:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 20))
        searchTextField.leftView = paddingView
        searchTextField.leftViewMode = .always
        
        data =   [
            ["title": "iOS", "subtitle": "16MP Front Camera" ],
            ["title": "Android", "subtitle": "Vivo V27 hosts an impactful camera profile on both ends, making it a seamless task for the vloggers to get"],
            ["title": "iOS", "subtitle": "8GB RAM"],
            ["title": "Android", "subtitle": "More spectrum bands supported by a handset would provide wider 5G connectivity across markets."],
            ["title": "Android", "subtitle": "Samsung Galaxy A14 5G is a true performer that brings a bundle of specs for your everyday requirements"],
            ["title": "iOS", "subtitle": "iOS is a true performer that brings a bundle of specs for your everyday"]
        ]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
   public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        //input text
       let searchText  = textField.text! + string
        //add matching text to array
    storeArray = self.data.filter({(($0["title"] as! String).localizedCaseInsensitiveContains(searchText)) || (($0["subtitle"] as! String).localizedCaseInsensitiveContains(searchText))})
    
    if(storeArray.count == 0){
            searching = false
    } else if(storeArray.count == 0){
            search = false
    }
    else{
            searching = true
        }
    
        self.contentTableView.reloadData()
        
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //check search text & original text
        if( searching == true){
            return storeArray.count
        }else if (search == true){
            return storeArray.count
        }else{
            return data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //custom cell Custom_cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataTableViewCell
        //check search text & original text
        if( searching == true){
            let content = storeArray[indexPath.row]
            cell.titleLabel.text = content["title"] as? String
            cell.subTitleLabel.text = content["subtitle"] as? String
        }else if( search == true){
            let content = storeArray[indexPath.row]
            cell.titleLabel.text = content["title"] as? String
            cell.subTitleLabel.text = content["subtitle"] as? String
        }else{
            let content = data[indexPath.row]
            cell.titleLabel.text = content["title"] as? String
            cell.subTitleLabel.text = content["subtitle"] as? String
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

