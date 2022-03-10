//
//  ViewController.swift
//  DiceApp
//
//  Created by Ensar Batuhan Ünverdi on 10.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var left: UIImageView!
    @IBOutlet weak var right: UIImageView!
    
    let items = [UIImage(named: "dice1"), UIImage(named: "dice2"), UIImage(named: "dice3"), UIImage(named: "dice4"), UIImage(named: "dice5"), UIImage(named: "dice6")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollTheDiceButton(_ button:UIButton) {
        
        let first = Int(arc4random_uniform(6))
        let second = Int(arc4random_uniform(6))
        
        left.image = items[first]
        right.image = items[second]
        
        
    }


}

