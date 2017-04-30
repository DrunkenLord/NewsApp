//
//  DescirptionViewController.swift
//  NewsApp
//
//  Created by Mehul  Singhal  on 30/04/17.
//  Copyright © 2017 Mehul  Singhal . All rights reserved.
//

import UIKit

class DescirptionViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let greenColor = UIColor(red: 0/255.0, green: 50/255.0, blue: 0/255.0, alpha: 1.0)
//        view.backgroundColor = greenColor
        textView.text = description_news
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
