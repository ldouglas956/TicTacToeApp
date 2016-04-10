//
//  ViewController.swift
//  TicTacToe
//
//  Created by Lance Douglas on 3/16/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	
	// MARK: Variables
	var clickSound: AVAudioPlayer!
	var turn = 0
	
	@IBOutlet weak var oneBtn: UIButton!
	@IBOutlet weak var twoBtn: UIButton!
	@IBOutlet weak var threeBtn: UIButton!
	@IBOutlet weak var fourBtn: UIButton!
	@IBOutlet weak var fiveBtn: UIButton!
	@IBOutlet weak var sixBtn: UIButton!
	@IBOutlet weak var sevenBtn: UIButton!
	@IBOutlet weak var eightBtn: UIButton!
	@IBOutlet weak var nineBtn: UIButton!
	
	// MARK: Functions
//
	override func viewDidLoad() {
		super.viewDidLoad()
	
		let path = NSBundle.mainBundle().pathForResource("click", ofType: "wav")
		let soundURL = NSURL(fileURLWithPath: path!)
		do {
			try	clickSound = AVAudioPlayer(contentsOfURL: soundURL)
			clickSound.prepareToPlay()
		} catch let err as NSError {
			print(err.debugDescription)
		}
	
	}
//
	@IBAction func onButtonPressed(sender: UIButton) {
		playSound()
		
		if sender.tag == 10 {
			sender.setImage(UIImage(named: "Dot.png"), forState: UIControlState.Normal)
			sender.tag = 11
			countTurns()
		} else {
			if turn % 2 == 0 {
				sender.setImage(UIImage(named: "ticX.png"), forState: UIControlState.Normal)
				sender.tag = 10
				countTurns()
			} else {
				sender.setImage(UIImage(named: "ticO.png"), forState: UIControlState.Normal)
				sender.tag = 10
				countTurns()
			}
		}
	}
//
	func countTurns() {
			turn += 1
	}
//
	func playSound() {
		if clickSound.playing {
			clickSound.stop()
		}
		clickSound.play()
	}
//
	
	
}

