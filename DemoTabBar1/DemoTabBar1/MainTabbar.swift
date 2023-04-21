//
//  MainTabbar.swift
//  ZoomTask
//
//  Created by Swayam on 14/12/21.
//

import UIKit

class MainTabbar: BubbleTabBarController, UITabBarControllerDelegate {

    @IBOutlet var demoTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("openTaskNotification"), object: nil)

    }

    @objc func methodOfReceivedNotification(notification: Notification) {

        if notification.name == Notification.Name("openTaskNotification") {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {
                self.selectedIndex = 1
            })
        }

        print("methodOfReceivedNotification")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("MainTabBarController - viewWillAppear")
        
        
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
       
    }
}
