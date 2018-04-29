//  Minor Programming, App Studio
//
//  ViewController.swift
//  Personality Quiz
//
//  Created by Eleanoor Polder (10979301) on 28-04-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  Code for introduction view controller.

import UIKit

class IntroductionViewController: UIViewController {

    /// Function for load.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    /// Function for memory.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Function that connects done button with introdction screen.
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
    }
}

