//
//  detailViewController.swift
//  JSON_MVCApplication
//
//  Created by mr.jb on 01/04/23.
//

import UIKit
import WebKit

class detailViewController: UIViewController {
    
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var web_img: WKWebView!
    
    var str_name=""
    var str_webImg=""
    
    var apiData = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countryLabel.text=str_name
        
        let url=URL(string: str_webImg)
        let req=URLRequest(url: url!)
        web_img.load(req)
    }
    


}
