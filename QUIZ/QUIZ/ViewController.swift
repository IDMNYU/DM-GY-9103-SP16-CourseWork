//
//  ViewController.swift
//  QUIZ
//
//  Created by Yuchi on 1/2/16.
//  Copyright © 2016 Yuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel : UILabel!
    @IBOutlet var answerLabel : UILabel!
    
    
    let questions: [String] = ["From what is cognac made?", "What is 7 + 7", "what is the capital of Vermont"]
    let answers: [String] = ["Graps", "14","Monteplier"]
    
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    
    
    @IBAction func showNextQuestion(sender: AnyObject){
        ++currentQuestionIndex
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
        let question:  String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer (sender: AnyObject){
        let answer: String = answers[currentQuestionIndex]
        print(answer)
        answerLabel.text = answer
    }




}

