//
//  ViewController.swift
//  abc
//
//  Created by MAC on 08/11/22.
//

//func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    print(indexPath.row)
//    print(indexPath.section)
// // print(Header[indexPath.row])
//
//}

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var Header = ["Fruits" , "Colors" , "Shapes"]
    var Item = [
        ["Apple" , "Mango" , "Grapes" , "Pineapple" , "Watermaloan" , "Banana"],
        ["Red" , "Orang" , "Black" ,"Pink" , "Magenta" , "Clay"],
        ["Circle" , "Oval" , "Square" , "Curve" , "Rectangle"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate  = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "abcTableViewCell", bundle: nil), forCellReuseIdentifier: "abcTableViewCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Header.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if (section  == 0 ) {
            return Item[section].count
        }
        if (section  == 1 ) {
           return Item[section].count
           }
        else  {
            return Item[section].count
           }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "abcTableViewCell", for: indexPath) as! abcTableViewCell
        cell.title.text = Item[indexPath.section][indexPath.row]
        cell.press.addTarget(self, action: #selector(onclick), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Header[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.red
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

            let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in

                let section = indexPath.section
                let row = indexPath.row
                self.Item[section].remove(at: row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                boolValue(true)
            }

            let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
            return swipeActions
        }
    
    @IBAction func onclick(_sender : UIButton){
        func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
        {
            let section = indexPath.section + indexPath.row
            if editingStyle == .delete
            {
                Item.remove(at: section)
                self.tableView.reloadData()
            }
        }
        }
    
}


