//
//  AdvertisingTableViewCell.swift
//  DZ2
//
//  Created by Andrey Dikarev on 29/10/2018.
//  Copyright © 2018 Andrey Dikarev. All rights reserved.
//

import UIKit

class AdvertisingTableViewCell: UITableViewCell {
    @IBOutlet weak var advertCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        advertCell.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        advertCell.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGesture(sender:UITapGestureRecognizer) {
        UIApplication.shared.open(NSURL(string:"https://www.futhead.com")! as URL)
    }
}
