//
//  ViewController.swift
//  TicTacToe
//
//  Created by Lance Douglas on 3/16/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import UIKit
import AVFoundation
import QuartzCore

class ViewController: UIViewController {
	
	// MARK: Variables
	var clickSound: AVAudioPlayer!
	var turn = 10
	
	@IBOutlet weak var oneBtn: UIButton!
	@IBOutlet weak var twoBtn: UIButton!
	@IBOutlet weak var threeBtn: UIButton!
	@IBOutlet weak var fourBtn: UIButton!
	@IBOutlet weak var fiveBtn: UIButton!
	@IBOutlet weak var sixBtn: UIButton!
	@IBOutlet weak var sevenBtn: UIButton!
	@IBOutlet weak var eightBtn: UIButton!
	@IBOutlet weak var nineBtn: UIButton!
	@IBOutlet weak var winner: UITextField!
	@IBOutlet weak var titleResetButton: UIButton!
	
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
		titleResetButton.userInteractionEnabled = false
	}
	//
	@IBAction func onButtonPressed(sender: UIButton) {
		playSound()
		
		if sender.tag == 2 || sender.tag == 3 {
			sender.setImage(UIImage(named: "Dot.png"), forState: UIControlState.Normal)
			sender.tag = 0
			countTurns()
		} else {
			if turn % 2 == 0 {
				sender.setImage(UIImage(named: "ticX.png"), forState: UIControlState.Normal)
				sender.tag = 2
				countTurns()
			} else {
				sender.setImage(UIImage(named: "ticO.png"), forState: UIControlState.Normal)
				sender.tag = 3
				countTurns()
			}
		}
		didWin()
		if didWin() {
			win()
		}
	}
	//
	@IBAction func resetButton(sender: UIButton) {
		resetGame()
	}
	//
	func didWin() -> Bool {
		if turn > 5 {
			if (oneBtn.tag == 2 && twoBtn.tag == 2 && threeBtn.tag == 2) || (oneBtn.tag == 3 && twoBtn.tag == 3 && threeBtn.tag == 3)  {
				return true
			} else if (fourBtn.tag == 2 && fiveBtn.tag == 2 && sixBtn.tag == 2) || (fourBtn.tag == 3 && fiveBtn.tag == 3 && sixBtn.tag == 3) {
				return true
			} else if (sevenBtn.tag == 2 && eightBtn.tag == 2 && nineBtn.tag == 2) || (sevenBtn.tag == 3 && eightBtn.tag == 3 && nineBtn.tag == 3) {
				return true
			} else if (oneBtn.tag == 2 && fourBtn.tag == 2 && sevenBtn.tag == 2) || (oneBtn.tag == 3 && fourBtn.tag == 3 && sevenBtn.tag == 3) {
				return true
			} else if (twoBtn.tag == 2 && fiveBtn.tag == 2 && eightBtn.tag == 2) || (twoBtn.tag == 3 && fiveBtn.tag == 3 && eightBtn.tag == 3) {
				return true
			} else if (threeBtn.tag == 2 && sixBtn.tag == 2 && nineBtn.tag == 2) || (threeBtn.tag == 3 && sixBtn.tag == 3 && nineBtn.tag == 3) {
				return true
			} else if (oneBtn.tag == 2 && fiveBtn.tag == 2 && nineBtn.tag == 2) || (oneBtn.tag == 3 && fiveBtn.tag == 3 && nineBtn.tag == 3) {
				return true
			} else if (threeBtn.tag == 2 && fiveBtn.tag == 2 && sevenBtn.tag == 2) || (threeBtn.tag == 3 && fiveBtn.tag == 3 && sevenBtn.tag == 3) {
				return true
			} else if (oneBtn.tag > 1 && twoBtn.tag > 1 && threeBtn.tag > 1 && fourBtn.tag > 1 && fiveBtn.tag > 1 && sixBtn.tag > 1 && sevenBtn.tag > 1 && eightBtn.tag > 1 && nineBtn.tag > 1) {
				winner.text = "DRAW"
				win()
				return false
			}
		}
		return false
	}
	//
	func resetGame() {
		oneBtn.tag = 0; twoBtn.tag = 0; threeBtn.tag = 0; fourBtn.tag = 0; fiveBtn.tag = 0; sixBtn.tag = 0; sevenBtn.tag = 0; eightBtn.tag = 0; nineBtn.tag = 0;
		oneBtn.setImage(UIImage(named: "Dot.png"), forState: UIControlState.Normal)
		twoBtn.setImage(UIImage(named: "Dot.png"), forState: UIControlState.Normal)
		threeBtn.setImage(UIImage(named: "Dot.png"), forState: UIControlState.Normal)
		fourBtn.setImage(UIImage(named: "Dot.png"), forState: UIControlState.Normal)
		fiveBtn.setImage(UIImage(named: "Dot.png"), forState: UIControlState.Normal)
		sixBtn.setImage(UIImage(named: "Dot.png"), forState: UIControlState.Normal)
		sevenBtn.setImage(UIImage(named: "Dot.png"), forState: UIControlState.Normal)
		eightBtn.setImage(UIImage(named: "Dot.png"), forState: UIControlState.Normal)
		nineBtn.setImage(UIImage(named: "Dot.png"), forState: UIControlState.Normal)
		turn = 10
		winner.hidden = true
		titleResetButton.setImage(UIImage(named: "Tic-Tac-Toe.png"), forState: UIControlState.Normal)
		titleResetButton.userInteractionEnabled = false
	}
	//
	func win() {
		if turn % 2 == 0 {
			winner.text = "O WINS!"
			winner.adjustsFontSizeToFitWidth = true
		} else {
			winner.text = "X WINS!"
		}
		winner.hidden = false
		winner.sizeToFit()
		titleResetButton.layer.zPosition = CGFloat.max
		titleResetButton.setImage(UIImage(named: "Play-Again.png"), forState: UIControlState.Normal)
		titleResetButton.userInteractionEnabled = true
		oneBtn.userInteractionEnabled = false
		twoBtn.userInteractionEnabled = false
		threeBtn.userInteractionEnabled = false
		fourBtn.userInteractionEnabled = false
		fiveBtn.userInteractionEnabled = false
		sixBtn.userInteractionEnabled = false
		sevenBtn.userInteractionEnabled = false
		eightBtn.userInteractionEnabled = false
		nineBtn.userInteractionEnabled = false
	}
	//
	func countTurns() {
		turn += 1
		print(turn)
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

