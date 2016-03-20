//
//  ViewController.swift
//  Calculator
//
//  Created by Xhriman on 2016/3/3.
//  Copyright © 2016年 Exwd. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var numberLabel: NumberLabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func numericButtonClicked(sender: AnyObject) {
		if (sender.tag < 10) {
			numberLabel.append(sender.tag)
		} else {
			numberLabel.appendFloatPoint()
		}
	}

	@IBAction func operatorButtonClicked(sender: AnyObject) {
		switch sender.tag {
		case 1:
			print("+")
		case 2:
			print("-")
		case 3:
			print("x")
		default:
			print("/")
		}
	}

	@IBAction func clear(sender: AnyObject) {
		numberLabel.clear()
	}

	@IBAction func changeSign(sender: AnyObject) {
		numberLabel.changeSign()
	}

	@IBAction func convertToPercentage(sender: AnyObject) {
		numberLabel.toPercentage()
	}

	@IBAction func calculate(sender: AnyObject) {
		print(numberLabel.value)
	}
}
