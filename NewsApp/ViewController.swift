//
//  ViewController.swift
//  NewsApp
//
//  Created by Mehul  Singhal  on 29/04/17.
//  Copyright © 2017 Mehul  Singhal . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BBCbutton: UIButton!
    @IBOutlet weak var TOIbutton: UIButton!
    @IBOutlet weak var Randombutton: UIButton!
    
    
    var news_channel: String!
    let apiKey = "86682be37eaa4e739dc706f4b750fe49"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BBCnews(_ sender: Any) {
        
        news_channel = "bbc-news"
//        let storyBoard = UIStoryboard(name: "sharingan", bundle: nil)
//        let controller = storyBoard.instantiateInitialViewController(withIdentifier: "sharingan")
//        self.present(controller!,animated:true,completion:nil)
        
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    @IBAction func TOInews(_ sender: Any) {
        
        news_channel = "the-times-of-india"
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    @IBAction func randomNews(_ sender: Any) {
        
        news_channel = "techcrunch"
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    
    


}

