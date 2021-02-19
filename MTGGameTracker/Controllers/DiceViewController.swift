//
//  DiceViewController.swift
//  MTGGameTracker
//
//  Created by Christina Dyrehauge on 02/02/2021.
//

import UIKit

class DiceViewController: UIViewController {
    
    @IBOutlet weak var p1DiceImage: UIImageView!
    @IBOutlet weak var p2DiceImage: UIImageView!
    @IBOutlet weak var p1WinnerLabel: UILabel!
    @IBOutlet weak var p2WinnerLabel: UILabel!
    @IBOutlet weak var p1Background: UIImageView!
    @IBOutlet weak var p2Background: UIImageView!
    
    var timer = Timer()
    
    var p1BackgroundColor: UIImage?
    var p2BackgroundColor: UIImage?
    
    var p1Dice = 1
    var p2Dice = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        p2WinnerLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        p1WinnerLabel.text = ""
        p2WinnerLabel.text = ""
        p1Background.image = p1BackgroundColor
        p2Background.image = p2BackgroundColor
    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func rollPressed(_ sender: UIButton) {
        p1WinnerLabel.text = ""
        p2WinnerLabel.text = ""
        p1DiceImage.isHidden = false
        p2DiceImage.isHidden = false
        
        p1Dice = [1, 2, 3, 4, 5, 6].randomElement()!
        p2Dice = [1, 2, 3, 4, 5, 6].randomElement()!
        
        p1DiceImage.image = UIImage(named: "Dice\(p1Dice)")
        p2DiceImage.image = UIImage(named: "Dice\(p2Dice)")
        
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)
    }
     
    @objc func updateTimer() {
        if p1Dice > p2Dice {
            p1WinnerLabel.text = K.Text.winnerText
            p2WinnerLabel.text = K.Text.loserText
            hideDiceImages()
            
        } else if p1Dice < p2Dice {
            p2WinnerLabel.text = K.Text.winnerText
            p1WinnerLabel.text = K.Text.loserText
            hideDiceImages()

        } else {
            p1WinnerLabel.text = K.Text.tieText
            p2WinnerLabel.text = K.Text.tieText
            hideDiceImages()
        }
    }
    
    func hideDiceImages() {
        p2DiceImage.isHidden = true
        p1DiceImage.isHidden = true
    }
    
}


