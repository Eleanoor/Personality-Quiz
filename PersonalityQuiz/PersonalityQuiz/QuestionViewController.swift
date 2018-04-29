//  Minor Programming, App Studio
//
//  ViewController.swift
//  Personality Quiz
//
//  Created by Eleanoor Polder (10979301) on 28-04-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  Code for the questions.

import UIKit

class QuestionViewController: UIViewController {
    
    // Questions and anwsers with corresponding vegetable.
    var questions: [Question] = [
        Question(text: "What is you favorite color?", type:.single, answers: [
            Answer(text:"Red", type: .tomato),
            Answer(text: "Purple", type: .eggplant),
            Answer(text: "Green", type: .cucumber),
            Answer(text: "Brown", type: .avocado)
        ]),
    
        Question(text: "What places in the world would you like to visit?", type: .multiple, answers: [
            Answer(text: "Central Amerika", type: .avocado),
            Answer(text: "South Amerika", type: .tomato),
            Answer(text: "Southeast Asia", type: .eggplant),
            Answer(text: "Europe", type: .cucumber)
        ]),
        
        Question(text: "How much are you aware of the enviroment?", type: .ranged, answers: [
                    Answer(text: "Not at all", type: .avocado),
                    Answer(text: "Not really", type: .eggplant),
                    Answer(text: "A little bit", type: .tomato),
                    Answer(text: "A lot", type: .cucumber)
        ]),
        
        Question(text: "What is your favorite cocktail?", type: .single, answers: [
            Answer(text: "Bloody Mary", type: .tomato),
            Answer(text: "Gin Tonic", type: .cucumber),
            Answer(text: "I don't like alcohol in my drink", type: .avocado),
            Answer(text: "I don't like drinks", type: .eggplant)
        ])
    ]
    
    // Connect buttons, labels and sliders.
    @IBOutlet weak var questionLabel: UILabel!

    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    // Initialize variables.
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    /// Function for loading.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    /// Function for Memory.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Function if the single answer button is pressed.
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    /// Function if the multible answer button is pressed.
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    /// Function if the ranged answer button is pressed.
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    /// Function to update each of the controls.
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) /
            Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated:
        true)
        
        switch currentQuestion.type {
            case .single: updateSingleStack(using: currentAnswers)
            case .multiple: updateMultipleStack(using: currentAnswers)
            case .ranged: updateRangedStack(using: currentAnswers)
        }
    }
    
    /// Function that updates the single stack.
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }

    /// Function that updates the multiple stack.
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }

    /// Function that updates the ranged stack.
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }

    /// Function to go to the next question.
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
        updateUI()
        } else {
        performSegue(withIdentifier: "ResultsSuege", sender: nil)
        }
    }

    /// Function that connects the question to the result stack
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if segue.identifier == "ResultsSuege" {
            let resultsViewController = segue.destination as!
            ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
}
