//
//  HomeViewController.swift
//  Tap War
//
//  Created by apple on 2018/7/3.
//  Copyright © 2018年 ANNIE. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var p1Name: UITextField!
   
    @IBOutlet weak var p2Name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destinationViewController = segue.destination as! viewController
        
        destinationViewController.player1Name = p1Name.text!
        destinationViewController.player2Name = p2Name.text!
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
