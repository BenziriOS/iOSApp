//
//  AppDelegate.swift
//  TabBarwithXib
//
//  Created by MAC on 24/02/23.
//

import UIKit
let SharedDelegate = UIApplication.shared.delegate as! AppDelegate
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationVC = UINavigationController()
    var initialViewController = UIViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initialViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
        self.navigationVC = UINavigationController(rootViewController: self.initialViewController)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.navigationVC
        self.window?.makeKeyAndVisible()
        self.navigationVC.setNavigationBarHidden(true, animated: true)
        return true
    }



}

