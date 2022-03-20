//
//  ViewController2.swift
//  Simpson
//
//  Created by Ensar Batuhan Ünverdi on 13.03.2022.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var jobLabel:UILabel!

    var selectedSimpson: Simpsons?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image
    }
    


}
