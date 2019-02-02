//
//  MasterViewController.swift
//  RCV
//
//  Created by Dan Wood on 2/2/19.
//  Copyright © 2019 gigliwood. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

	var detailViewController: DetailViewController? = nil
	var objects =
	
		[
			["name": "Snoop Dog", "file": "dog.png", "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rutrum pretium erat, in mattis leo consectetur vitae. Phasellus venenatis est in tempus dignissim. Vestibulum elit elit, malesuada sed nunc vitae, ultrices tristique mi. Praesent convallis nunc leo. Phasellus quis ornare nisi. Vivamus vestibulum, elit at dignissim pharetra, ligula urna maximus quam, a sagittis diam nibh nec sem. Quisque convallis nunc quis dolor euismod ultricies. Praesent eget aliquet magna. Vestibulum posuere risus massa, quis vehicula eros scelerisque at." ],
			["name": "Wilbur Horse", "file": "horse.png", "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rutrum pretium erat, in mattis leo consectetur vitae. Phasellus venenatis est in tempus dignissim. Vestibulum elit elit, malesuada sed nunc vitae, ultrices tristique mi. Praesent convallis nunc leo. Phasellus quis ornare nisi. Vivamus vestibulum, elit at dignissim pharetra, ligula urna maximus quam, a sagittis diam nibh nec sem. Quisque convallis nunc quis dolor euismod ultricies. Praesent eget aliquet magna. Vestibulum posuere risus massa, quis vehicula eros scelerisque at." ],
			["name": "Felix Cat", "file": "cat.png", "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rutrum pretium erat, in mattis leo consectetur vitae. Phasellus venenatis est in tempus dignissim. Vestibulum elit elit, malesuada sed nunc vitae, ultrices tristique mi. Praesent convallis nunc leo. Phasellus quis ornare nisi. Vivamus vestibulum, elit at dignissim pharetra, ligula urna maximus quam, a sagittis diam nibh nec sem. Quisque convallis nunc quis dolor euismod ultricies. Praesent eget aliquet magna. Vestibulum posuere risus massa, quis vehicula eros scelerisque at." ],
			["name": "Gary Gorilla", "file": "gorilla.png", "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rutrum pretium erat, in mattis leo consectetur vitae. Phasellus venenatis est in tempus dignissim. Vestibulum elit elit, malesuada sed nunc vitae, ultrices tristique mi. Praesent convallis nunc leo. Phasellus quis ornare nisi. Vivamus vestibulum, elit at dignissim pharetra, ligula urna maximus quam, a sagittis diam nibh nec sem. Quisque convallis nunc quis dolor euismod ultricies. Praesent eget aliquet magna. Vestibulum posuere risus massa, quis vehicula eros scelerisque at." ],
			["name": "Ratatouille", "file": "rat.png", "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rutrum pretium erat, in mattis leo consectetur vitae. Phasellus venenatis est in tempus dignissim. Vestibulum elit elit, malesuada sed nunc vitae, ultrices tristique mi. Praesent convallis nunc leo. Phasellus quis ornare nisi. Vivamus vestibulum, elit at dignissim pharetra, ligula urna maximus quam, a sagittis diam nibh nec sem. Quisque convallis nunc quis dolor euismod ultricies. Praesent eget aliquet magna. Vestibulum posuere risus massa, quis vehicula eros scelerisque at." ],
			["name": "Porky Pig", "file": "pig.png", "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rutrum pretium erat, in mattis leo consectetur vitae. Phasellus venenatis est in tempus dignissim. Vestibulum elit elit, malesuada sed nunc vitae, ultrices tristique mi. Praesent convallis nunc leo. Phasellus quis ornare nisi. Vivamus vestibulum, elit at dignissim pharetra, ligula urna maximus quam, a sagittis diam nibh nec sem. Quisque convallis nunc quis dolor euismod ultricies. Praesent eget aliquet magna. Vestibulum posuere risus massa, quis vehicula eros scelerisque at." ],
			["name": "Roger Rabbit", "file": "rabbit.png", "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rutrum pretium erat, in mattis leo consectetur vitae. Phasellus venenatis est in tempus dignissim. Vestibulum elit elit, malesuada sed nunc vitae, ultrices tristique mi. Praesent convallis nunc leo. Phasellus quis ornare nisi. Vivamus vestibulum, elit at dignissim pharetra, ligula urna maximus quam, a sagittis diam nibh nec sem. Quisque convallis nunc quis dolor euismod ultricies. Praesent eget aliquet magna. Vestibulum posuere risus massa, quis vehicula eros scelerisque at." ],
			["name": "Tony Tiger", "file": "tiger.png", "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rutrum pretium erat, in mattis leo consectetur vitae. Phasellus venenatis est in tempus dignissim. Vestibulum elit elit, malesuada sed nunc vitae, ultrices tristique mi. Praesent convallis nunc leo. Phasellus quis ornare nisi. Vivamus vestibulum, elit at dignissim pharetra, ligula urna maximus quam, a sagittis diam nibh nec sem. Quisque convallis nunc quis dolor euismod ultricies. Praesent eget aliquet magna. Vestibulum posuere risus massa, quis vehicula eros scelerisque at." ],
			["name": "Lungren Dolphin", "file": "dolphin.png", "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rutrum pretium erat, in mattis leo consectetur vitae. Phasellus venenatis est in tempus dignissim. Vestibulum elit elit, malesuada sed nunc vitae, ultrices tristique mi. Praesent convallis nunc leo. Phasellus quis ornare nisi. Vivamus vestibulum, elit at dignissim pharetra, ligula urna maximus quam, a sagittis diam nibh nec sem. Quisque convallis nunc quis dolor euismod ultricies. Praesent eget aliquet magna. Vestibulum posuere risus massa, quis vehicula eros scelerisque at." ],
			["name": "Roger Rhinoceros", "file": "rhinoceros.png", "bio": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut rutrum pretium erat, in mattis leo consectetur vitae. Phasellus venenatis est in tempus dignissim. Vestibulum elit elit, malesuada sed nunc vitae, ultrices tristique mi. Praesent convallis nunc leo. Phasellus quis ornare nisi. Vivamus vestibulum, elit at dignissim pharetra, ligula urna maximus quam, a sagittis diam nibh nec sem. Quisque convallis nunc quis dolor euismod ultricies. Praesent eget aliquet magna. Vestibulum posuere risus massa, quis vehicula eros scelerisque at." ]
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		navigationItem.leftBarButtonItem = editButtonItem
		if let split = splitViewController {
		    let controllers = split.viewControllers
		    detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
		}
	
	}

	override func viewWillAppear(_ animated: Bool) {
		clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
		super.viewWillAppear(animated)
	}

	// MARK: - Segues

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail" {
		    if let indexPath = tableView.indexPathForSelectedRow {
				let object = objects[indexPath.row] ["bio"]!
		        let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
		        controller.detailItem = object
		        controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
		        controller.navigationItem.leftItemsSupplementBackButton = true
		    }
		}
	}

	// MARK: - Table View

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 2	// voting area, and candidate area
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String {
	
		switch(section) {
			case 1:
				return "Your Candidates"
			default:
				return "Your Vote"
		}
	}
	
	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		//Need to create a label with the text we want in order to figure out height
		let label: UILabel = createFooterLabel(section)
		let size = label.sizeThatFits(CGSize(width: view!.bounds.width, height: CGFloat.greatestFiniteMagnitude))
		let padding: CGFloat = 20.0
		return size.height + padding
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		let footerView = UITableViewHeaderFooterView()
		let label = createFooterLabel(section)
		label.autoresizingMask = [.flexibleHeight]
		footerView.addSubview(label)
		return footerView
	}
	
	func createFooterLabel(_ section: Int)->UILabel {
		let widthPadding: CGFloat = 20.0
		let label: UILabel = UILabel(frame: CGRect(x: widthPadding, y: 0, width: self.view!.bounds.width - widthPadding*2, height: 0))
		
		switch(section) {
		case 1:
			label.text = "This list of candidates was provided in an arbitrary order."
		default:
			label.text = "Vote for your favorite candidate as #1. If you want, vote a second and third choice in case your favorites don’t win. Only rank the candidates you would want to win."
		}
		
		label.numberOfLines = 0;
		label.textAlignment = NSTextAlignment.left
		label.lineBreakMode = NSLineBreakMode.byWordWrapping
		label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
		return label
	}
	
override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
	if indexPath.section == 0 {
		return 88;
	}
	return -1;
}

	override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
		if let header = view as? UITableViewHeaderFooterView {
			header.textLabel!.font = UIFont.systemFont(ofSize: 17.0)
			header.textLabel!.textColor = .red
		}
	}


	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		switch(section) {
		case 1:
			return objects.count
		default:
			return 1
		}
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch(indexPath.section) {
		case 1:

			let cell = tableView.dequeueReusableCell(withIdentifier: "CandidatesCell", for: indexPath)
			
			let object = objects[indexPath.row] ["name"]
			cell.textLabel!.text = object

			if let im = objects[indexPath.row] ["file"] {
				cell.imageView!.image = UIImage(named: im)
			}
			return cell


		default:

			let cell = tableView.dequeueReusableCell(withIdentifier: "VotingCell", for: indexPath)
			return cell
 
		}
	}
	
	override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		guard let tableViewCell = cell as? VotingTableViewCell else { return }
		
		tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
	}

	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return false
	}

//	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//		if editingStyle == .delete {
//		    objects.remove(at: indexPath.row)
//		    tableView.deleteRows(at: [indexPath], with: .fade)
//		} else if editingStyle == .insert {
//		    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//		}
//	}


}



extension MasterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VoteCell",
													  for: indexPath as IndexPath)
		
		cell.backgroundColor = .red
		
		return cell

	}
	
	func collectionView(_ collectionView: UICollectionView,
						numberOfItemsInSection section: Int) -> Int {
		
		return 3
	}
	
}
