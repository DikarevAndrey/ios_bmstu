//
//  FeedModel.swift
//  DZ2
//
//  Created by Andrey Dikarev on 21/10/2018.
//  Copyright © 2018 Andrey Dikarev. All rights reserved.
//

import Foundation

final class FeedModel {
    var footballers: [Footballer]
    
    init() {
        let footballer1 = Footballer(image: #imageLiteral(resourceName: "Robben"), name: "Arjen Robben", team: "FC Bayern", rating: 85)
        let footballer2 = Footballer(image: #imageLiteral(resourceName: "Lewandowski"), name: "Robert Lewandowski", team: "FC Bayern", rating: 90)
        let footballer3 = Footballer(image: #imageLiteral(resourceName: "Modric"), name: "Luka Modric", team: "Real Madird", rating: 91)
        let footballer4 = Footballer(image: #imageLiteral(resourceName: "Ramos"), name: "Sergio Ramos", team: "Real Madrid", rating: 91)
        let footballer5 = Footballer(image: #imageLiteral(resourceName: "De Bruyne"), name: "Kevin De Bruyne", team: "Manchester City", rating: 91)
        let footballer6 = Footballer(image: #imageLiteral(resourceName: "Hazard"), name: "Eden Hazard", team: "Chelsea", rating: 91)
        let footballer7 = Footballer(image: #imageLiteral(resourceName: "Hummels"), name: "Mats Hummels", team: "FC Bayern", rating: 89)
        footballers = [footballer1, footballer2, footballer3, footballer4, footballer5, footballer6, footballer7]
    }
}
