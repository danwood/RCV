//
//  DetailViewController.swift
//  RCV
//
//  Created by Dan Wood on 2/2/19.
//  Copyright © 2019 gigliwood. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var detailDescriptionLabel: UILabel!


	func configureView() {
		// Update the user interface for the detail item.
		if let label = detailDescriptionLabel {
			label.text = detailItem
		}
	}


	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		configureView()
	}

	var detailItem: String = ""	{
		didSet {
		    // Update the view.
		    configureView()
		}
	}

}

