//
//  RobotAlignement.swift
//  RVR_Brain
//
//  Created by Al on 25/08/2023.
//

import Foundation
import CoreGraphics

class RobotAlignment {
    
    // Dimensions du champ de vision du robot ou de la taille de l'image
    var imageWidth: CGFloat
    var imageHeight: CGFloat
    
    // Zone autorisée où le point doit être centré
    // Par exemple, si tolérance = 0.2, la zone autorisée est de 20% autour du centre
    var tolerance: CGFloat
    
    var inverted:Bool = false
    
    init(imageWidth: CGFloat, imageHeight: CGFloat, tolerance: CGFloat = 0.2, inverted:Bool = false) {
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.tolerance = tolerance
        self.inverted = inverted
    }
    
    // Fonction qui prend un CGPoint et indique si le robot doit tourner à gauche ou à droite
    func alignRobot(with point: CGPoint) -> String {
        
        let centerX = imageWidth / 2
        let minY = centerX - (imageWidth * tolerance / 2)
        let maxY = centerX + (imageWidth * tolerance / 2)
        
        if point.x > minY && point.x < maxY {
            return "stop"
        } else if point.x < minY {
            return inverted ? "right" : "left"
        } else {
            return inverted ? "left" : "right"
        }
    }
    
    
}
