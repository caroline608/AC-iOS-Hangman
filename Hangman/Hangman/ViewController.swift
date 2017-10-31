//
//  ViewController.swift
//  Hangman
//
//  Created by Marcel Chaucer on 10/18/17.
//  Copyright © 2017 Marcel Chaucer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var hangmanImages: UIImageView!
    @IBOutlet weak var inputGuess: UITextField!
    @IBOutlet weak var gameWord: UITextField!
    @IBOutlet weak var underscoreLabel: UILabel!
    @IBOutlet weak var allLettersGuessed: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    
    //    var brain = HangmanBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputGuess.delegate = self
        gameWord.delegate = self
        
    }
    
    //    Number of guesses that player got wrong
    //    Game ends when this value reaches 7
    var numberOfWrongGuesses = 0
    
    var dict:[Character: [Int]] = [:]
    var arrChar:[Character] = []
    
    @IBAction func newGamePressed(_ sender: UIButton) {
        gameWord.isHidden = false
        gameWord.isEnabled = true
        gameWord.text = ""
        underscoreLabel.text = ""
        allLettersGuessed.text = ""
        inputGuess.text = ""
        numberOfWrongGuesses = 0
        inputGuess.isEnabled = true
        newGameButton.isHidden = true
        hangmanImages.image = nil
        inputGuess.isEnabled = false
        dict = [:]
        arrChar = []
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        gameWord.isHidden = true
        textField.resignFirstResponder()
        print(gameWord.text!.count)
        var labelStr = " "
        var index = 0
        for ch in gameWord.text! {
            arrChar.append("_")
            if dict[ch] == nil {
                dict[ch] = []
            }
            dict[ch]!.append(index)
            labelStr.append("_ ")
            index += 1
        }
        underscoreLabel.text = labelStr
        inputGuess.isEnabled = true
        return true
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        let characterSet = CharacterSet.letters
        if string.rangeOfCharacter(from: characterSet.inverted) != nil {
            return false
        }
        
        if inputGuess == textField {
            if allLettersGuessed.text!.contains(string) {
            }else {
                allLettersGuessed.text?.append(string)
                let arrOfChar = dict[string.first!]
                if arrOfChar != nil {
                    for i in arrOfChar! {
                        arrChar[i] = string.first!
                    }
                    var str = ""
                    for ch in arrChar {
                        str.append(ch)
                        str.append(" ")
                    }
                    underscoreLabel.text = str
                    
                } else {
                    var hangmanImage = [#imageLiteral(resourceName: "man1"),#imageLiteral(resourceName: "man2"),#imageLiteral(resourceName: "man3"),#imageLiteral(resourceName: "man4"),#imageLiteral(resourceName: "man5"),#imageLiteral(resourceName: "man6"),#imageLiteral(resourceName: "man7")]
                    hangmanImages.image = hangmanImage[numberOfWrongGuesses]
                    numberOfWrongGuesses += 1
                    //            for my reference
                    print("The number of guesses you have left: \(7 - numberOfWrongGuesses)")
                    print("You have guessed wrong \(numberOfWrongGuesses) time")
                    if numberOfWrongGuesses == hangmanImage.count {
                        inputGuess.isEnabled = false
                        underscoreLabel.text = gameWord.text
                        newGameButton.isHidden = false
                    }
                }
                if underscoreLabel.text!.contains("_") {
                }else{
                    inputGuess.isEnabled = false
                    newGameButton.isHidden = false
                    print("You've won!")
                }
            }
            return false
        }
        return true
    }
    
    
}
