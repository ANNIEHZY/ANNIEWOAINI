//
//  VictoryViewController.swift
//  Tap War
//
//  Created by apple on 2018/7/2.
//  Copyright © 2018年 ANNIE. All rights reserved.
//

import UIKit

class VictoryViewController: UIViewController {
    var winnerName = ""
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.text = winnerName 
        // Do any additional setup after loading the view.
    }

    @IBAction func topRestartButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)}
    
    @IBAction func bottomRestartButton(_ sender: Any) {
    dismiss(animated: true, completion: nil)}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     

    

}
