//
//  ViewController.swift
//  Tap War
//
//  Created by apple on 2018/7/2.
//  Copyright © 2018年 ANNIE. All rights reserved.
//

import UIKit
import AVFoundation

class viewController: UIViewController {
    
    var player1Name = "player 1"
    var player2Name = "player 2"
    
    var tapTopCount = 0;
    var tapBottomCount  = 0;
    var Player1Score = 0;
    var Player2Score = 0;
    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var player1score: UILabel!
    @IBOutlet weak var player2score: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    
    let feedbackGenerator = UIImpactFeedbackGenerator()
    
    override func viewDidLoad() {
        player1score.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        topButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        player1score.text = player1Name
        player2score.text = player2Name
    }
    
    @IBAction func tapTopButton(_ sender: Any) {
        playSound(named: "22222")
        tapTopCount = tapTopCount + 1;
        topButton.setTitle(String(tapTopCount), for: .normal)
        feedbackGenerator.impactOccurred()
        random(button: topButton)
        if tapTopCount >= 20{
        performSegue(withIdentifier:"player1win", sender: self)
            Player1Score = Player1Score + 1;
            player1score.text = String(Player1Score)
            reset()
        }
    }

    @IBAction func tapBottomButton(_ sender: Any){
        playSound(named: "22222")
        tapBottomCount = tapBottomCount + 1;
    bottomButton.setTitle(String(tapBottomCount), for: .normal)
        feedbackGenerator.impactOccurred()
        random(button: bottomButton)
        if tapBottomCount >= 20{
             performSegue(withIdentifier:"player2win", sender: self)
            Player2Score = Player2Score + 1;
            player2score.text = String(Player2Score)
            reset()
    }
    }
    func random(button: UIButton){
        UIView.animate(withDuration: 0.1, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            button.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: nil)
        UIView.animate(withDuration: 0.1, delay: 0.1, options: UIViewAnimationOptions.allowUserInteraction, animations: {
             button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
    }

    func reset() {
            tapTopCount = 0
            tapBottomCount = 0
            topButton.setTitle(String(0), for: .normal)
        bottomButton.setTitle(String(0),for: .normal)
    }
    
    func playSound(named soundName: String){
        let soundURL = Bundle.main.path (forResource: "22222", ofType:"mp3")
        player = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: soundURL!)as URL, fileTypeHint: AVFileType.mp3.rawValue)
        player.play()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! VictoryViewController
        
        if tapTopCount > tapBottomCount {
            destinationViewController.winnerName = player1Name
        }
        else {
            destinationViewController.winnerName = player2Name
        }
      
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
