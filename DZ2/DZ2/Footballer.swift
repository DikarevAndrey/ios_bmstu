//
//  Footballer.swift
//  DZ2
//
//  Created by Andrey Dikarev on 21/10/2018.
//  Copyright © 2018 Andrey Dikarev. All rights reserved.
//

import Foundation
import UIKit

final class Footballer {
    var image: UIImage
    var name: String
    var team: String
    var rating: Int
    
    init(image: UIImage, name: String, team: String, rating: Int) {
        self.image = image
        self.name = name
        self.team = team
        self.rating = rating
    }
}
