//
//  MultipleChoiceViewController.swift
//  Quiz Football
//
//  Created by Витя on 27.01.17.
//  Copyright © 2017 Blan. All rights reserved.
//

import UIKit

class MultipleChoiceViewController: UIViewController {
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var cardButton: UIButton!
    
    @IBAction func answerButtonHandler(sender: UIButton) {
        timer.invalidate()
        
        if sender.titleLabel!.text == correctAnswer {
            print("Correct")
            currentScore += 1
            cardButton.isEnabled = true
        } else {
            sender.backgroundColor = UIColor.red
            print("Wrong Answer")
            showAlert(slow: false)
        }
        
        answerButtons.forEach {
            $0.isEnabled = false
            
            if $0.titleLabel!.text == correctAnswer {
                $0.backgroundColor = UIColor.green
            }
        }
    }
    
    @IBAction func cardButtonHandler(sender: AnyObject) {
        cardButton.isEnabled = false
        if questionIdx < (mcArray!).count - 1 {
            questionIdx += 1
        }
        else{
            questionIdx = 0
        }
        nextQuestion()
    }
    
    var correctAnswer: String?
    var question: String?
    var answers = [String]()
    var questionIdx = 0
    var timer = Timer()
    var currentScore = 0
    var highscore = UserDefaults.standard.integer(forKey: "highscore_MC")
    let localscore = NSLocalizedString("Score", comment: "")
    let localrecord = NSLocalizedString("Highscore", comment: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 10)
        cardButton.isEnabled = true
        mcArray!.shuffle()
        nextQuestion()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func nextQuestion(){
        
        let currentQuestion = mcArray![questionIdx]
        
        answers = currentQuestion["Answers"] as! [String]
        correctAnswer = currentQuestion["Correct Answer"] as? String
        question = currentQuestion["Question"] as? String
        
        titlesForButtons()
    }
    
    func titlesForButtons() {
        
        for(idx,button) in answerButtons.enumerated()
        {
            button.titleLabel!.lineBreakMode = .byWordWrapping
            button.setTitle(answers[idx], for: .normal)
            button.isEnabled = true
            button.backgroundColor = UIColor(red: 83.0/255.0, green: 184.0/255.0, blue: 224.0/255.0, alpha: 1.0)
        }
        
        questionLabel.text = question
        startTimer()
    }
    
    func startTimer(){
        progressView.progress = 1.0
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MultipleChoiceViewController.updateProgressView), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateProgressView(){
        progressView.progress -= 0.01/30
        if progressView.progress <= 0 {
            outOfTime()
        }
    }
    
    func outOfTime(){
        timer.invalidate()
        showAlert(slow: true)
        disableButtons()
    }
    
    func disableButtons(){
        for button in answerButtons{
            button.isEnabled = false
        }
        
    }
    
    func showAlert(slow: Bool) {
        
        if currentScore > highscore{
            highscore = currentScore
            
            UserDefaults.standard.set(highscore, forKey: "highscore_MC")
        }
        
        UserDefaults.standard.set(currentScore, forKey: "score_MC")
        
        var title: String?
        
        if slow {
            title = NSLocalizedString("Too very slow", comment: "")
        } else {
            title = NSLocalizedString("Incorrect answer", comment: "")
        }
        
         let alertController = UIAlertController(title: title, message: "\(localscore): \(currentScore)\n \(localrecord): \(highscore)", preferredStyle:UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (alert: UIAlertAction!) in
            self.backToMenu()
        })
        
        alertController.addAction(ok)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func backToMenu(){
       _  = navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
