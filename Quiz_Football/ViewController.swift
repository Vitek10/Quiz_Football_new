//
//  ViewController.swift
//  Quiz Football
//
//  Created by Витя on 27.01.17.
//  Copyright © 2017 Blan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadQuizData()
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(true)
        
        navigationController?.setNavigationBarHidden(true, animated:false)
    }
    
    func loadQuizData() {
        let pathMC = Bundle.main.path(forResource: "MultipleChoice", ofType: "plist")
        let dictMC = NSDictionary(contentsOfFile: pathMC!)
        mcArray = dictMC?.value(forKey: "Questions") as? Array
        
        let pathROW = Bundle.main.path(forResource: "RightorWrong", ofType: "plist")
        let dictROW = NSDictionary(contentsOfFile: pathROW!)
        rowArray = dictROW?.value(forKey: "Questions") as? Array
        
        let pathIMG = Bundle.main.path(forResource: "ImageQuiz", ofType: "plist")
        let dictIMG = NSDictionary(contentsOfFile: pathIMG!)
        imgArray = dictIMG?.value(forKey: "Questions") as? Array
        
        check()
    }
    
    func check(){
        print(mcArray as Any)
        print(rowArray as Any)
        print(imgArray as Any)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

