//
//  ImageDetailViewController.swift
//  DZ2
//
//  Created by Andrey Dikarev on 29/10/2018.
//  Copyright © 2018 Andrey Dikarev. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
    @IBOutlet weak var detailedImage: UIImageView!
    
    var footballerImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailedImage.image = footballerImage
        detailedImage.isUserInteractionEnabled = true
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pinchGesture))
        detailedImage.addGestureRecognizer(pinchGesture)
    }
    
    @objc func pinchGesture(sender:UIPinchGestureRecognizer) {
        sender.view?.transform = ((sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!)
        sender.scale = 1.0
    }
}
