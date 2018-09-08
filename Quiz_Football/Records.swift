//
//  Records.swift
//  Quiz_Football_2017
//
//  Created by Витя on 01.03.17.
//  Copyright © 2017 Blan. All rights reserved.
//

import UIKit

class Records: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var highscoreLabel: UILabel!
    @IBOutlet var scoreRowLabel: UILabel!
    @IBOutlet var highscoreRowLabel: UILabel!
    @IBOutlet var scoreImgLabel: UILabel!
    @IBOutlet var highscoreImgLabel: UILabel!

    let localscore = NSLocalizedString("Score", comment: "")
    let localrecord = NSLocalizedString("Highscore", comment: "")
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(false, animated:false)
        
        let score = UserDefaults.standard.integer(forKey: "score_MC")
        let highscore = UserDefaults.standard.integer(forKey: "highscore_MC")
        
        scoreLabel.text = "\(localscore): \(score)"
        highscoreLabel.text = "\(localrecord): \(highscore)"
        
        let scoreRow = UserDefaults.standard.integer(forKey: "score_ROW")
        let highscoreRow = UserDefaults.standard.integer(forKey: "highscore_ROW")
        
        scoreRowLabel.text = "\(localscore): \(scoreRow)"
        highscoreRowLabel.text = "\(localrecord): \(highscoreRow)"
        
        let scoreImg = UserDefaults.standard.integer(forKey: "score_IMG")
        let highscoreImg = UserDefaults.standard.integer(forKey: "highscore_IMG")
        
        scoreImgLabel.text = "\(localscore): \(scoreImg)"
        highscoreImgLabel.text = "\(localrecord): \(highscoreImg)"
        
    }
}
