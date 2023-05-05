//
//  ViewController.swift
//  API_Get_POST
//
//  Created by Jahangir Bavra on 05/04/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mytable: UITableView!
    
    var apidata=[APIModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAPI()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btn_next(_ sender: Any)
    {
        let secondVC=storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func fetchAPI()
    {
        let url=URL(string: "https://cloudrestapi.pythonanywhere.com/apiview/?format=json")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            do
            {
                self.apidata=try JSONDecoder().decode([APIModel].self, from: data!)
                print(self.apidata)
                DispatchQueue.main.async {
                    self.mytable.reloadData()
                }
            }
            catch
            {
                print(String(describing: error))
            }
            
        }.resume()
    }

}
extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apidata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text=apidata[indexPath.row].event_name
        cell.detailTextLabel?.text=apidata[indexPath.row].event_information
        
        return cell
    }
    
    
}
