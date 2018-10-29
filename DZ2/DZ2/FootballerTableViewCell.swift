//
//  FootballerTableViewCell.swift
//  DZ2
//
//  Created by Andrey Dikarev on 21/10/2018.
//  Copyright © 2018 Andrey Dikarev. All rights reserved.
//

import UIKit

class FootballerTableViewCell: UITableViewCell {

    @IBOutlet weak var footballerImage: UIImageView!
    @IBOutlet weak var footballerName: UILabel!
    @IBOutlet weak var footballerTeam: UILabel!
    @IBOutlet weak var footballerRating: UILabel!
    
    private var footballer: Footballer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        footballerName.adjustsFontSizeToFitWidth = true
        footballerTeam.adjustsFontSizeToFitWidth = true
        footballerRating.adjustsFontSizeToFitWidth = true
    }

    func configureView(footballer: Footballer) {
        self.footballer = footballer
        footballerImage.image = footballer.image
        footballerName.text = footballer.name
        footballerTeam.text = footballer.team
        footballerRating.text = "\(footballer.rating)"
    }
}
