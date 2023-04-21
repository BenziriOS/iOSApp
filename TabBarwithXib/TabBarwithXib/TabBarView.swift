//
//  TabBarView.swift
//  SoundMedicine
//
//  Created by S10 on 06/02/23.
//

import UIKit

public enum MenuType {
    case home
    case search
    case me
    case settings
}

class TabBarView: UIView {

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var homeBarView: UIView!

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchBarView: UIView!

    @IBOutlet weak var meButton: UIButton!
    @IBOutlet weak var meLabel: UILabel!
    @IBOutlet weak var meImageView: UIImageView!
    @IBOutlet weak var meBarView: UIView!

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var settingsImageView: UIImageView!
    @IBOutlet weak var settingsBarView: UIView!

    let unSelectedMenuFont = "Poppins-Medium"
    let unSelectedMenuFontSize = 12.0

    let selectedMenuFont = "Poppins-Bold"
    let selectedMenuFontSize = 12.0

    var lastSelectedMenu:MenuType = .home

    var onComplete:((MenuType) -> Void)?

    override func layoutSubviews() {
        super.layoutSubviews()
        homeBarView.layer.cornerRadius = 1.5
        searchBarView.layer.cornerRadius = 1.5
        meBarView.layer.cornerRadius = 1.5
        settingsBarView.layer.cornerRadius = 1.5
    }

    override func awakeFromNib(){
        super.awakeFromNib()
        self.layer.cornerRadius = 34.0
        self.clipsToBounds = true
       
    }

    func selectedMenu(menu: MenuType) {

        lastSelectedMenu = menu

        homeLabel.font = UIFont(name: unSelectedMenuFont, size: CGFloat(unSelectedMenuFontSize))
        homeImageView.image = UIImage(named: "home")
        homeBarView.backgroundColor = .clear

        searchLabel.font = UIFont(name: unSelectedMenuFont, size: CGFloat(unSelectedMenuFontSize))
        searchImageView.image = UIImage(named: "search")
        searchBarView.backgroundColor = .clear

        meLabel.font = UIFont(name: unSelectedMenuFont, size: CGFloat(unSelectedMenuFontSize))
        meImageView.image = UIImage(named: "profile")
        meBarView.backgroundColor = .clear

        settingsLabel.font = UIFont(name: unSelectedMenuFont, size: CGFloat(unSelectedMenuFontSize))
        settingsImageView.image = UIImage(named: "settings")
        settingsBarView.backgroundColor = .clear

        if menu == .home {
            homeLabel.font = UIFont(name: selectedMenuFont, size: CGFloat(selectedMenuFontSize))
            homeImageView.image = UIImage(named: "home-fill")
            homeBarView.backgroundColor = .white
        }else if menu == .search {
            searchLabel.font = UIFont(name: selectedMenuFont, size: CGFloat(selectedMenuFontSize))
            searchImageView.image = UIImage(named: "search-fill")
            searchBarView.backgroundColor = .white
        }else if menu == .me {
            meLabel.font = UIFont(name: selectedMenuFont, size: CGFloat(selectedMenuFontSize))
            meImageView.image = UIImage(named: "profile-fill")
            meBarView.backgroundColor = .white
        }else if menu == .settings {
            settingsLabel.font = UIFont(name: selectedMenuFont, size: CGFloat(selectedMenuFontSize))
            settingsImageView.image = UIImage(named: "settings-fill")
            settingsBarView.backgroundColor = .white
        }
    }

    @IBAction func userHandleAction(_ sender: UIButton) {
        if sender == homeButton {
            if lastSelectedMenu != .home {
                NavigationManager.shared.getNextStepInOnboarding(currentStep: NextViewController.home)
                
            }
        }else if sender == searchButton {
            if lastSelectedMenu != .search {
                NavigationManager.shared.getNextStepInOnboarding(currentStep: NextViewController.search)
            }
        }else if sender == meButton {
            if lastSelectedMenu != .me {
                NavigationManager.shared.getNextStepInOnboarding(currentStep: NextViewController.me)
            }
        }else if sender == settingsButton {
            if lastSelectedMenu != .settings {
                NavigationManager.shared.getNextStepInOnboarding(currentStep: NextViewController.setting)
            }
        }
    }
}
