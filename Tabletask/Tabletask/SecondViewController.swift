//
//  SecondViewController.swift
//  Tabletask
//
//  Created by mr.jb on 27/03/23.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var mylbl: UILabel!
    var data1:String = ""
    var newdt=[""]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newdt=UserDefaults.standard.value(forKey: "dt") as! [String]
        print(newdt)
        mylbl.text = data1
    }
    

}
