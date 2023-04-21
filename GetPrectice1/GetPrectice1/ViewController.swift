//
//  ViewController.swift
//  GetPrectice1
//
//  Created by mr.jb on 15/04/23.
//

import UIKit

class ViewController: UIViewController {
var apidata = Array<Any>()
    override func viewDidLoad() {
        super.viewDidLoad()
       fetch()
    }

    func fetch(){
        let url = URL(string: "https://restcountries.com/v2/all")
        
        do{
            let info = try Data(contentsOf: url!)
            apidata = try JSONSerialization.jsonObject(with: info) as! Array<Any>
            print(apidata)
        }
        
        catch
        {
            print(error.localizedDescription)
        }
    }
}

