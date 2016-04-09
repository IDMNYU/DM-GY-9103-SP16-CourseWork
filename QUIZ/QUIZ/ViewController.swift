//
//  ViewController.swift
//  QUIZ
//
//  Created by Yuchi on 1/2/16.
//  Copyright © 2016 Yuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    @IBOutlet var questionLabel : UILabel!
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!

    @IBOutlet var answerLabel : UILabel!
    
    
    let questions: [String] = ["From what is cognac made?", "What is 7 + 7?", "What is the capital of Vermont?"]
    let answers: [String] = ["Grapes", "14","Monteplier"]
    
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let question = questions[currentQuestionIndex]
        currentQuestionLabel.text = question
        
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //set the label's initial alpha
        nextQuestionLabel.alpha = 0
        
    }
    
    func updateOffScreenLabel(){
        
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
    
    @IBAction func showNextQuestion(sender: AnyObject){
        ++currentQuestionIndex
        
        if currentQuestionIndex == questions.count{
            currentQuestionIndex = 0
        }
        
        let question:  String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()

    }
    
    @IBAction func showAnswer (sender: AnyObject){
        let answer: String = answers[currentQuestionIndex]
        print(answer)
        answerLabel.text = answer
    }
    
    func animateLabelTransitions(){
        //force any outstanding layout changes to occur
        view.layoutIfNeeded()
    
//        
//        let animationClosure = { () -> Void in
//        self.questionLabel.alpha = 1
//        }
 
        //Animate the alpha
//        UIView.animateWithDuration(0.5, animations: animationClosure)
        
//        UIView.animateWithDuration(0.5, animations: {
//            self.currentQuestionLabel.alpha = 1
//            self.nextQuestionLabel.alpha = 1})
//
//    }
       
        //animate the center X constraints
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
//        UIView.animateWithDuration(0.5, delay: 0, options: [.CurveLinear], animations: {
//        self.currentQuestionLabel.alpha = 0
//        self.nextQuestionLabel.alpha = 1
//            self.view.layoutIfNeeded()
//        },
        
        UIView.animateWithDuration(
            0.5,
            delay: 0,
            usingSpringWithDamping: 10,
            initialSpringVelocity: 8,
            options: [],
            animations: {
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
                self.view.layoutIfNeeded()
                },
            
            completion:  { _ in
                swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                
                self.updateOffScreenLabel()
        
        })
    }


}

