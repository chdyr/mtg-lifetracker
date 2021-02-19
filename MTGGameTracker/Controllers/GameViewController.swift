//
//  ViewController.swift
//  MTGGameTracker
//
//  Created by Christina Dyrehauge on 27/01/2021.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var p1LifeLabel: UILabel!
    @IBOutlet weak var p2LifeLabel: UILabel!
    @IBOutlet weak var p1PlusButton: UIButton!
    @IBOutlet weak var p2PlusButton: UIButton!
    @IBOutlet weak var p1MinusButton: UIButton!
    @IBOutlet weak var p2MinusButton: UIButton!
    @IBOutlet weak var p1SettingsButton: UIButton!
    @IBOutlet weak var p2SettingsButton: UIButton!
    @IBOutlet weak var p1MenuView: UIView!
    @IBOutlet weak var p2MenuView: UIView!
    @IBOutlet weak var p1Background: UIImageView!
    @IBOutlet weak var p2Background: UIImageView!
    
    var gameManager = GameManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p2LifeLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        p2MenuView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        p1PlusButton.setShadow()
        p2PlusButton.setShadow()
        p1MinusButton.setShadow()
        p2MinusButton.setShadow()
        p1SettingsButton.setShadow()
        p2SettingsButton.setShadow()
        p1MenuView.setRoundedCorners()
        p2MenuView.setRoundedCorners()
    }
    
    @IBAction func p1PlusPressed(_ sender: UIButton) {
        p1LifeLabel.text = String(gameManager.addOne(isPlayer1: true))
    }
    
    @IBAction func p1MinusPressed(_ sender: UIButton) {
        p1LifeLabel.text = String(gameManager.subtractOne(isPlayer1: true))
    }
    
    @IBAction func p2PlusPressed(_ sender: UIButton) {
        p2LifeLabel.text = String(gameManager.addOne(isPlayer1: false))
    }
    
    @IBAction func p2MinusPressed(_ sender: UIButton) {
        p2LifeLabel.text = String(gameManager.subtractOne(isPlayer1: false))
    }
    
    @IBAction func p1SettingsPressed(_ sender: UIButton) {
        if !UIWindow.isLandscape {
            p1MenuView.isHidden = true ? !p1MenuView.isHidden : p1MenuView.isHidden
        }
    }
    
    @IBAction func p2SettingsPressed(_ sender: UIButton) {
        if !UIWindow.isLandscape {
            p2MenuView.isHidden = true ? !p2MenuView.isHidden : p2MenuView.isHidden
        }
    }
    
    @IBAction func p1SelectBackground(_ sender: UIButton) {
        p1Background.image = gameManager.selectColor(to: sender)
        
        if p1Background.image == UIImage(named: K.BackgroundColors.black) {
            p1PlusButton.tintColor = .white
            p1MinusButton.tintColor = .white
            p1SettingsButton.tintColor = .white
        }
        p1MenuView.isHidden = true
    }
    
    @IBAction func p2SelectedBackground(_ sender: UIButton) {
        p2Background.image = gameManager.selectColor(to: sender)
        
        if p2Background.image == UIImage(named: K.BackgroundColors.black) {
            p2PlusButton.tintColor = .white
            p2MinusButton.tintColor = .white
            p2SettingsButton.tintColor = .white
        }
        p2MenuView.isHidden = true
    }
    
    @IBAction func restartGamePressed(_ sender: UIButton) {
        p1LifeLabel.text = String(gameManager.resetPlayerLife())
        p2LifeLabel.text = String(gameManager.resetPlayerLife())
    }
    
    @IBAction func showScoreboardPressed(_ sender: UIButton) {
        // More to come
    }
    
    @IBAction func rollDicePressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.Segues.diceSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segues.diceSegue {
            let destVC = segue.destination as! DiceViewController
            destVC.p1BackgroundColor = p1Background.image
            destVC.p2BackgroundColor = p2Background.image
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { context in
            if UIDevice.current.orientation.isLandscape {
                self.p1MenuView.isHidden = true
                self.p2MenuView.isHidden = true
            }
        })
    }
}

//MARK: - Extensions

extension UIButton {
    func setShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.00).cgColor
        self.layer.shadowOffset = CGSize(width: 4, height: 1)
        self.layer.shadowOpacity = 8.0
    }
}

extension UIView {
    func setRoundedCorners() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}

extension UIWindow {
    static var isLandscape: Bool {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows
                .first?
                .windowScene?
                .interfaceOrientation
                .isLandscape ?? false
        } else {
            return UIApplication.shared.statusBarOrientation.isLandscape
        }
    }
}
