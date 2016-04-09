//
//  ViewController.swift
//  Quiz
//
//  Created by Keval Shah on 2/1/16.
//  Copyright © 2016 Keval Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    let questions: [String] = ["From what is cognac made?","What is 7+7?","What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes","14","Montpelier"]
    
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel()
    {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    
    @IBAction func showNextQuestion(sender: AnyObject)
    {
        ++currentQuestionIndex
        if currentQuestionIndex == questions.count
        {
            currentQuestionIndex = 0
        }
        
        let question:  String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject)
    {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        nextQuestionLabel.alpha = 0
    
    }
    
    func animateLabelTransitions()
    {
     //   let animationClosure = { () -> Void in
       //     self.questionLabel.alpha = 1
        //}
        
        view.layoutIfNeeded()
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5,options: [.CurveLinear], animations: { self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            self.view.layoutIfNeeded() },completion: {_ in swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
        swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
        self.updateOffScreenLabel()
        })
    }
}

