//
//  ViewController.swift
//  tabprogram
//
//  Created by MAC on 08/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
       let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("LogIn", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        button.center = view.center
    }
    
    @objc func didTapButton(){
        
        let tabBarVC = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 =  UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: FourthViewController())
        let vc5 = UINavigationController(rootViewController: FifthViewController())
        
        vc1.title = "Home"
        vc2.title = "Contact"
        vc3.title = "About"
        vc4.title = "Help"
        vc5.title = "Seting"
        
        tabBarVC.setViewControllers([vc1 , vc2   ,vc3 , vc4, vc5], animated: false)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let  image = ["house", "bell", "person.circle", "star", "gear"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: image[x])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        
        present(tabBarVC, animated: true)
    }
}

class FirstViewController: UIViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Home"
        
    }
}

class SecondViewController: UIViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
       title = "Contact"
        
    }
}

class ThirdViewController: UIViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        title = "About"
        
    }
}

class FourthViewController: UIViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Help"
        
    }
}

class FifthViewController: UIViewController{
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        title = "Setting"
        
    }
}
