//
//  ViewController.swift
//  Silly Song
//
//  Created by Samita Mandwe on 8/14/17.
//  Copyright © 2017 udacity. All rights reserved.
//

import UIKit

func shortNameForName(_ name: String) -> String {
    let lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiouAEIOU")
    
    if let rangeOfVowel = name.rangeOfCharacter(from: vowelSet, options : .caseInsensitive)
    {
        
        return lowercaseName.substring(from: rangeOfVowel.lowerBound)
        
    }
    
    return lowercaseName
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")


func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortname = shortNameForName(fullName)
    
    let lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortname)
    
    return lyrics
}

class ViewController: UIViewController {

    
    @IBOutlet weak var namefield: UITextField!
    
    
    @IBOutlet weak var lyricsView: UITextView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        namefield.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func reset(_ sender: Any) {
    namefield.text = ""
    lyricsView.text = ""
        
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        
        if !(namefield.text?.isEmpty)!
        {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: namefield.text!)
        }
        else {
            lyricsView.text = "check"
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
