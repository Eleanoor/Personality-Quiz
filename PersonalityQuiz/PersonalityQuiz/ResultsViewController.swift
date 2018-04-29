//  Minor Programming, App Studio
//
//  ViewController.swift
//  Personality Quiz
//
//  Created by Eleanoor Polder (10979301) on 28-04-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  Code for the results.

import UIKit

class ResultsViewController: UIViewController {

    // Connect labels.
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses: [Answer]!

    /// Function for loading.
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }

    /// Function that calculates the answer
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [VegetableSort: Int] = [:]
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
    
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
    }

    /// Function for memory.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// Function for preparation.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
