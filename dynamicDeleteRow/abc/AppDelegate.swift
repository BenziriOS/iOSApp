//
//  AppDelegate.swift
//  abc
//
//  Created by MAC on 08/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

//    let point = _sender.convert(CGPoint.zero , to:tableView)
//    guard let indexPath = tableView.indexPathForRow(at: point) else {
//        return
//    }
//    let contextItem = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
//        switch indexPath.section{
//        case 0:
//            //1 i tried this
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//        case 1:
//            //2 and i tried this
//            self.tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 1)], with: .automatic)
//        case 2:
//            //2 and i tried this
//            self.tableView.deleteRows(at: [IndexPath(row: indexPath.row, section: 2)], with: .automatic)
//        default:break
//        }
//
//        boolValue(true)
//    }
//               // Item.remove(at: indexPath.row)
//   
//   
//                tableView.deleteRows(at: [indexPath], with: .fade)
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
}

//func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
//{
//    if editingStyle == .delete
//    {
//        items.remove(at: indexPath.row)
//        self.tableView.reloadData()

//func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//   // return Item[section].count
//    if section == 0 {
//        return Item.count
//        }
//    if section == 1 {
//        return Item.count
//        }else  {
//            return Item.count
//        }
//
//indexForCell =  Item[indexPath.row]

//    }
//}

