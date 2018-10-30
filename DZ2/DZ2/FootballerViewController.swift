//
//  FootballerViewController.swift
//  DZ2
//
//  Created by Andrey Dikarev on 22/10/2018.
//  Copyright © 2018 Andrey Dikarev. All rights reserved.
//

import UIKit

class FootballerViewController: UIViewController {
    @IBOutlet weak var footballerImage: UIImageView!
    @IBOutlet weak var footballerName: UILabel!
    @IBOutlet var footballerView: UIView!
    
    private let segueName = "toDetailedImage"
    var footballer: Footballer!
    
    func toggleDarkTheme(isDarkThemeEnabled: Bool) {
        if isDarkThemeEnabled {
            self.navigationController?.navigationBar.barTintColor  = UserSettings.darkThemeBackgroundColor
            footballerView.backgroundColor = UserSettings.darkThemeBackgroundColor
            footballerName.textColor = UserSettings.darkThemeTextColor
        } else {
            self.navigationController?.navigationBar.barTintColor  = UserSettings.lightThemeBackgroundColor
            footballerView.backgroundColor = UserSettings.lightThemeBackgroundColor
            footballerName.textColor = UserSettings.lightThemeTextColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        footballerImage.image = footballer.image
        footballerName.text = footballer.name
        footballerName.adjustsFontSizeToFitWidth = true
        
        footballerImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        footballerImage.addGestureRecognizer(tapGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        toggleDarkTheme(isDarkThemeEnabled: UserSettings.darkThemeEnabled)
    }
    
    @objc func tapGesture(sender: UITapGestureRecognizer) {
        print("Tapped\n")
        let footballerImageView = sender.view as! UIImageView
        performSegue(withIdentifier: segueName, sender: footballerImageView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueName {
            guard
                let vc = segue.destination as? ImageDetailViewController,
                let image = sender as? UIImageView
                else { return }
            vc.footballerImage = image.image
        }
    }
    
}
