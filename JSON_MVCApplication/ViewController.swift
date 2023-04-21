//
//  ViewController.swift
//  JSON_MVCApplication
//
//  Created by mr.jb on 01/04/23.
//

import UIKit
import Kingfisher

class ViewController: UIViewController, UISearchControllerDelegate {
  
    @IBOutlet var tableview: UITableView!
    var apiArray=[apidata]()
    var mysearch=UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDetail()
        searchSetup()
        tableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func searchSetup()
    {
        navigationItem.searchController=mysearch
        mysearch.delegate=self
        mysearch.searchResultsUpdater=self
    }

    func showDetail()
    {
        let url = URL(string: "https://restcountries.com/v2/all")
        URLSession.shared.dataTask(with: url!) {  data , response , error in
            
            do
            {
                self.apiArray=try JSONDecoder().decode([apidata].self, from: data!)
                
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
            catch
            {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
}

extension ViewController: UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
      
        let cell = tableview.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.lbl1?.text = apiArray[indexPath.row].name
        cell.lblk2?.text = apiArray[indexPath.row].capital
        let url=URL(string: apiArray[indexPath.row].flags.png!)
        cell.img.kf.setImage(with: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
        detailViewController.str_name=apiArray[indexPath.row].name!
        detailViewController.str_webImg=apiArray[indexPath.row].flags.png!
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

}
extension ViewController:UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        guard let searchtext = mysearch.searchBar.text else { return
            
        }
        
        if searchtext==""
        {
            self.showDetail()
        }
        else
        {
            self.apiArray=apiArray.filter{
                ($0.name?.contains(searchtext))!
            }
        }
        self.tableview.reloadData()
    }
    
    
}
