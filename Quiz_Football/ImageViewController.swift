//
//  ImageViewController.swift
//  Quiz Football
//
//  Created by Витя on 27.01.17.
//  Copyright © 2017 Blan. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var cardButton: UIButton!
    
    var correctAnswer: String?
    var answers = [String]()
    var image: String?
    var questionIdx = 0
    var timer = Timer()
    var currentScore = 0
    var highscore = UserDefaults.standard.integer(forKey: "highscore_IMG")
    let localscore = NSLocalizedString("Score", comment: "")
    let localrecord = NSLocalizedString("Highscore", comment: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 10)
        
        cardButton.isEnabled = true
        
        imgArray?.shuffle()
        nextQuestion()
    }
    
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
            
            if $0.titleLabel?.text == correctAnswer {
                $0.backgroundColor = UIColor.green
            }
        }
    }
    
    @IBAction func cardButtonHandler(sender: AnyObject) {
        cardButton.isEnabled = false
        
        let count = imgArray?.count ?? 0
        
        questionIdx = questionIdx < count - 1 ? questionIdx + 1 : 0
        
        nextQuestion()
    }

    func nextQuestion(){
        
        let currentQuestion = imgArray?[questionIdx]
        
        guard let answers = currentQuestion?["Answers"] as? [String],
            let correctAnswer = currentQuestion?["Correct Answer"] as? String,
            let image = currentQuestion?["Question"] as? String else { return }
        
        self.answers = answers
        self.correctAnswer = correctAnswer
        self.image = image
        
        titlesForButtons()
    }
    
    
    func titlesForButtons() {
        
        for (idx,button) in answerButtons.enumerated() {
            button.titleLabel!.lineBreakMode = .byWordWrapping
            button.setTitle(answers[idx], for: .normal)
            button.isEnabled = true
            button.backgroundColor = UIColor(rgb: 83, 184, 224)
        }
        
        guard let image = image else { return }
        
        ImageView.image = UIImage(named: image)
        startTimer()
    }
    
    func startTimer(){
        progressView.progress = 1.0
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(ImageViewController.updateProgressView),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func updateProgressView(){
        progressView.progress -= 0.01 / 30
        
        if progressView.progress <= 0 {
            dis.outofTime(btn: answerButtons)
        }
    }
    //private var dis = DisableButtons()
//    func outOfTime(){
//        timer.invalidate()
//        showAlert(slow: true)
//        //dis.outofTime()
//    }
    
//    func disableButtons() {
//        answerButtons.forEach {
//            $0.isEnabled = false
//        }
//    }
    
    func showAlert(slow: Bool) {
        
        if currentScore > highscore {
            highscore = currentScore
            
            UserDefaults.standard.set(highscore, forKey: "highscore_IMG")
        }
        
        UserDefaults.standard.set(currentScore, forKey: "score_IMG")
        
        var title: String?
        
        if slow {
            title = NSLocalizedString("Too very slow", comment: "")
        } else {
            title = NSLocalizedString("Incorrect answer", comment: "")
        }
        
        let alertController = UIAlertController(title: title, message: "\(localscore): \(currentScore)\n \(localrecord): \(highscore)", preferredStyle:UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.backToMenu()
        }
        alertController.addAction(ok)
        
        present(alertController, animated: true)
    }
    
    func backToMenu(){
        _ = navigationController?.popToRootViewController(animated: true)
    }
}
let showAlImg = RightorWrongViewController()
