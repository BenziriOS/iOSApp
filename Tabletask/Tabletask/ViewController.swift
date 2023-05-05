//
//  ViewController.swift
//  Tabletask
//
//  Created by mr.jb on 27/03/23.
//

import UIKit

class ViewController: UIViewController {

    var data=[""]
    
    var selectedData=[""]
    @IBOutlet var mytable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        data=["C","C++","Python","JAVA","PHP","Ruby","iOS","Android","HTML"]
    }

    @IBAction func btn_final(_ sender: Any)
    {
        selectedData.removeAll()
        if let x = mytable.indexPathsForSelectedRows
        {
            for i in x
            {
                selectedData.append(data[i.row])
            }
            for _ in selectedData
            {
                UserDefaults.standard.set(selectedData, forKey: "dt")
                //print(selectedData)
            }
        }
        
        let secondVC=storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text=data[indexPath.row]
        cell.accessoryType = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mytable.cellForRow(at: indexPath)?.accessoryType = .checkmark
        let SecondViewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        SecondViewController.data1=data[indexPath.row]
        navigationController?.pushViewController(SecondViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        mytable.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
}
