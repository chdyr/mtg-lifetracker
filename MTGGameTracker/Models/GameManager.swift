//
//  GameBrain.swift
//  MTGGameTracker
//
//  Created by Christina Dyrehauge on 28/01/2021.
//

import Foundation
import UIKit

struct GameManager {
    
    var p1Life = 40
    var p2Life = 40
    
    mutating func addOne(isPlayer1: Bool) -> Int {
        if isPlayer1 {
            p1Life += 1
            return p1Life
        } else {
            p2Life += 1
            return p2Life
        }
    }
    
    mutating func subtractOne(isPlayer1: Bool) -> Int {
        if isPlayer1 {
            p1Life -= 1
            return p1Life
        } else {
            p2Life -= 1
            return p2Life
        }
    }
    
    func selectColor(to sender: UIButton) -> UIImage? {
        switch sender.currentTitle {
        case "White":
            return UIImage(named: K.BackgroundColors.white)
        case "Blue":
            return UIImage(named: K.BackgroundColors.blue)
        case "Black":
            return UIImage(named: K.BackgroundColors.black)
        case "Red":
            return UIImage(named: K.BackgroundColors.red)
        case "Green":
            return UIImage(named: K.BackgroundColors.green)
        default:
            return UIImage(named: K.BackgroundColors.black)
        }
    }
    
    func resetPlayerLife() -> Int {
        return 40
    }
}
