//
//  ViewController.swift
//  SVProgressApp
//
//  Created by Jahangir Bavra on 14/04/23.
//

import UIKit
import SVProgressHUD

struct APIModel:Codable
{
    var name:String?
    var capital:String?
}

class ViewController: UIViewController {

    @IBOutlet weak var mytable: UITableView!
    var apidata=[APIModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAPI()
        // Do any additional setup after loading the view.
    }
    
    func fetchAPI()
    {
        //SVProgressHUD.show(withStatus: "Please Wait...")
        SVProgressHUD.show(UIImage(named: "loading.png")!, status: "Wait...")
        let url=URL(string: "https://restcountries.com/v2/all")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            do
            {
                self.apidata=try JSONDecoder().decode([APIModel].self, from: data!)
                print(self.apidata)
                DispatchQueue.main.async {
                    self.mytable.reloadData()
                    SVProgressHUD.dismiss()
                }
            }
            catch
            {
                print(String(describing: error))
            }
        }
        .resume()
    }

}

extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apidata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell=UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text=apidata[indexPath.row].name
        cell.detailTextLabel?.text=apidata[indexPath.row].capital
        cell.accessoryType = .detailButton
        return cell
    }
    
    
}
