//
//  HangmanBrain.swift
//  Hangman
//
//  Created by Keshawn Swanston on 10/29/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//

import Foundation
import UIKit

enum Guess {
    case right, wrong
}

//
//class HangmanBrain  {
//    
//    func getNextImage() -> UIImage {
//        currentIndex += 1
//        if currentIndex > hangmanImages.count - 1 {
//            currentIndex = 0
//        }
//        let returnImage = hangmanImages[currentIndex]
//        return returnImage
//    }
//    var currentIndex = 0
//    
//    private var hangmanImages = [#imageLiteral(resourceName: "man1"),#imageLiteral(resourceName: "man2"),#imageLiteral(resourceName: "man3"),#imageLiteral(resourceName: "man4"),#imageLiteral(resourceName: "man5"),#imageLiteral(resourceName: "man6"),#imageLiteral(resourceName: "man7")]
//}
//func changeImage (hangmanImage: (UIImageView) -> [UIImage]) {
//    let newImage = brain.getNextImage()
//    hangmanImages.image = newImage
//}

