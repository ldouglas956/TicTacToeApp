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
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let path = NSBundle.mainBundle().pathForResource("click", ofType: "wav")
		let soundURL = NSURL(fileURLWithPath: path!)
		
		// Swift makes you check to prevent crasing if AVAudioPlayer does not work with sound
		do {
			try	clickSound = AVAudioPlayer(contentsOfURL: soundURL)
			clickSound.prepareToPlay()
		} catch let err as NSError {
			print(err.debugDescription)
		}
		
	}
	
	
	// MARK: Button Layout
	
	@IBAction func onButtonPressed(sender: UIButton) {
		playSound()
	}
	
	func playSound() {
//		if clickSound.playing {
//			clickSound.stop()
//		}
		clickSound.play()
	}
	


}

