//
//  ViewController.swift
//  WebviewApp
//
//  Created by mr.jb on 31/03/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var myweb: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loaddata()
        // Do any additional setup after loading the view.
    }
    
    func loaddata()
    {
        let url=URL(string: "https://www.youtube.com")
        let req=URLRequest(url: url!)
        myweb.load(req)
        
    }


}

