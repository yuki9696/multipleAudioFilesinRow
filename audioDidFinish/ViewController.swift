//
//  audioDidFinish
//
//  Created by Yuki Yamamoto on 2017/02/12.
//  Copyright © 2017年 Yuki Yamamoto. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        player1?.delegate = self
        player2?.delegate = self
        player3?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    let music1 = Bundle.main.bundleURL.appendingPathComponent("music1.mp3")
    let music2 = Bundle.main.bundleURL.appendingPathComponent("music2.mp3")
    let music3 = Bundle.main.bundleURL.appendingPathComponent("music2.mp3")


    let url1 = Bundle.main.bundleURL.appendingPathComponent("music1.mp3")
    let url2 = Bundle.main.bundleURL.appendingPathComponent("music2.mp3")
    let url3 = Bundle.main.bundleURL.appendingPathComponent("music3.mp3")

    
    @IBOutlet weak var yourButton1: customButton!
    @IBOutlet weak var yourButton2: customButton!
    @IBOutlet weak var yourButton3: customButton!
    @IBOutlet weak var yourButton4: customButton!
    
    fileprivate var player1:AVAudioPlayer?
    fileprivate var player2:AVAudioPlayer?
    fileprivate var player3:AVAudioPlayer?
    
    
    @IBAction func pushButton1(sender: UIButton) {
        Player(url: url1)
    }
    
    @IBAction func pushButton2(sender: UIButton) {
        Player1(url: url2)
    }
    
    @IBAction func pushButton3(_ sender: UIButton) {
        Player2(url: url1, url2: url2, url3: url3)
    }
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if (player === player1) {
            yourButton1.isSelected = false
            yourButton2.isSelected = true
            do {
                //initialise player 2
                player2 = try AVAudioPlayer(contentsOf: url2)
            }catch {
                
            }
            player2!.play()
        } else if (player === player2) {
            yourButton3.isSelected = true
            yourButton2.isSelected = false
            do {
                //initialise player 3
                player3 = try AVAudioPlayer(contentsOf: url3)
            }catch {
                
            }
            player3!.play()
        } else if (player === player3) {
            yourButton3.isSelected = false
        }
    }
    
    
    
    
    
    func Player(url: URL) {
        do {
            try player1 = AVAudioPlayer(contentsOf:url)
            player1!.play()
            yourButton1.isSelected = true
            player1!.delegate = self
        } catch {
            print(error)
        }
    }
    
    func Player1(url: URL) {
        do {
            try player2 = AVAudioPlayer(contentsOf:url)
            player2!.play()
            yourButton2.isSelected = true
            player2!.delegate = self
            
        } catch {
            print(error)
        }
    }
    
    func Player2(url: URL, url2: URL, url3: URL) {
        do {
            try player3 = AVAudioPlayer(contentsOf:url)
            try player2 = AVAudioPlayer(contentsOf: url2)
            try player1 = AVAudioPlayer(contentsOf: url3)
            player3!.play()
            yourButton1.isSelected = true
            player3!.delegate = self
            player2!.delegate = self
            player1!.delegate = self

        } catch {
            print(error)
        }
    }
}


