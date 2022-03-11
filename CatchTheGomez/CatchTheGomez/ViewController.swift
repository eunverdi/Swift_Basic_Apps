//
//  ViewController.swift
//  CatchTheGomez
//
//  Created by Ensar Batuhan Ünverdi on 11.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: -Variables
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 0
    var score = 0
    var gomezArray = [UIImageView]()
    var highScore = 0
    
    
    //MARK: -Labels
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    
    //MARK: -Views
    @IBOutlet weak var gomez1: UIImageView!
    @IBOutlet weak var gomez2: UIImageView!
    @IBOutlet weak var gomez3: UIImageView!
    @IBOutlet weak var gomez4: UIImageView!
    @IBOutlet weak var gomez5: UIImageView!
    @IBOutlet weak var gomez6: UIImageView!
    @IBOutlet weak var gomez7: UIImageView!
    @IBOutlet weak var gomez8: UIImageView!
    @IBOutlet weak var gomez9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        counter = 10
        timeLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideGomez), userInfo: nil, repeats: true)
        
        //MARK: -Images Interaction
        gomez1.isUserInteractionEnabled = true
        gomez2.isUserInteractionEnabled = true
        gomez3.isUserInteractionEnabled = true
        gomez4.isUserInteractionEnabled = true
        gomez5.isUserInteractionEnabled = true
        gomez6.isUserInteractionEnabled = true
        gomez7.isUserInteractionEnabled = true
        gomez8.isUserInteractionEnabled = true
        gomez9.isUserInteractionEnabled = true

        //MARK: -Creating Recognizer
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        //MARK: -Adding Recognizer to Images
        gomez1.addGestureRecognizer(recognizer1)
        gomez2.addGestureRecognizer(recognizer2)
        gomez3.addGestureRecognizer(recognizer3)
        gomez4.addGestureRecognizer(recognizer4)
        gomez5.addGestureRecognizer(recognizer5)
        gomez6.addGestureRecognizer(recognizer6)
        gomez7.addGestureRecognizer(recognizer7)
        gomez8.addGestureRecognizer(recognizer8)
        gomez9.addGestureRecognizer(recognizer9)
        
        
        gomezArray = [gomez1,gomez2,gomez3,gomez4,gomez5,gomez6,gomez7,gomez8,gomez9]
        hideGomez()
        
    }
    
   //MARK: -Functions
    @objc func countdown() {
        counter -= 1
        timeLabel.text = String(counter)
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for gomez in gomezArray {
                gomez.isHidden = true
            }
            
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "High Score: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
            //MARK: -Alert
            let alert = UIAlertController(title: "Time's Up!", message: "Do you want to play again?", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style:.default) { (UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideGomez), userInfo: nil, repeats: true)
                
            }
            alert.addAction(replayButton)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    
    @objc func hideGomez()
    {
        for gomez in gomezArray {
            gomez.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(gomezArray.count - 1)))
        gomezArray[random].isHidden = false
    }
}
