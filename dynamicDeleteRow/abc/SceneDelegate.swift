//
//  SceneDelegate.swift
//  abc
//
//  Created by MAC on 08/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

//import UIKit
//
//class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    var item = [Things]()
//    
//    class Things{
//        
//    var name : String?
//    var objects : [String]?
//    
//    init(name : String , objects : [String] ){
//    
//    self.name = name
//    self.objects  = objects
//        
//        }
//}
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        item.append(Things.init(name : "Fruit" , objects : ["Apple" , "Mango" , "Grapes"]))
//        item.append(Things.init(name : "color" , objects : ["Red" , "Orange" , "Black" , "Pink"]))
//        item.append(Things.init(name : "Shape" , objects : ["circle" , "oval" ]))
//                    
//        tableView.delegate  = self
//        tableView.dataSource = self
//        tableView.register(UINib(nibName: "abcTableViewCell", bundle: nil), forCellReuseIdentifier: "abcTableViewCell")
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return item.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//       // return Item[section].count
//        return item[section].objects?.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "abcTableViewCell", for: indexPath) as! abcTableViewCell
//      //  cell.title.text = object[indexPath.section][indexPath.section]
//        cell.title.text = item[indexPath.section].objects![indexPath.row]
//      //  cell.press.addTarget(self, action: #selector(onclick), for: .touchUpInside)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return item[section].name
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//        print(indexPath.section)
//      //  print(Header[indexPath.row])
//      //  print(Item[indexPath.section])
//
//    }
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//            let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
//
//                let section = indexPath.section
//               // let row = indexPath.row
//
//
//               
//                self.item.remove(at: section )
//                self.tableView.deleteRows(at: [indexPath], with: .automatic)
//
//                boolValue(true)
//            }
//
//            let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])
//
//
//            return swipeActions
//        }
//    @IBAction func onclick(_sender : UIButton){
//        func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
//        {
//            let section = indexPath.section + indexPath.row
//           if editingStyle == .delete
//            {
//
//            item.remove(at: section)
//                self.tableView.reloadData()
//            }
//        }
//        }
//    
//}
