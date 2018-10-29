//
//  UserSettingsViewController.swift
//  DZ2
//
//  Created by Andrey Dikarev on 29/10/2018.
//  Copyright © 2018 Andrey Dikarev. All rights reserved.
//

import UIKit

class UserSettingsViewController: UIViewController {
    @IBOutlet weak var darkThemeLabel: UILabel!
    @IBOutlet weak var darkThemeSwitch: UISwitch!
    @IBOutlet var userSettingsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkThemeSwitch.isOn = UserSettings.darkThemeEnabled
        toggleDarkTheme(isDarkThemeEnabled: UserSettings.darkThemeEnabled)
    }
    
    func toggleDarkTheme(isDarkThemeEnabled: Bool) {
        if isDarkThemeEnabled {
            darkThemeLabel.textColor = UserSettings.darkThemeTextColor
            darkThemeLabel.backgroundColor = UserSettings.darkThemeBackgroundColor
            darkThemeSwitch.backgroundColor = UserSettings.darkThemeBackgroundColor
            userSettingsView.backgroundColor = UserSettings.darkThemeBackgroundColor
        } else {
            darkThemeLabel.textColor = UserSettings.lightThemeTextColor
            darkThemeLabel.backgroundColor = UserSettings.lightThemeBackgroundColor
            darkThemeSwitch.backgroundColor = UserSettings.lightThemeBackgroundColor
            userSettingsView.backgroundColor = UserSettings.lightThemeBackgroundColor
        }
    }
    
    @IBAction func darkThemeSwitchValueChanged(_ sender: Any) {
        UserSettings.darkThemeEnabled = darkThemeSwitch.isOn
        toggleDarkTheme(isDarkThemeEnabled: UserSettings.darkThemeEnabled)
    }
}
