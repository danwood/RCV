//
//  MasterViewController.swift
//  RCV
//
//  Created by Dan Wood on 2/2/19.
//  Copyright © 2019 gigliwood. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, UITableViewDragDelegate, UITableViewDropDelegate, UICollectionViewDragDelegate, UICollectionViewDropDelegate {

	var collectionView : UICollectionView? = nil

	var detailViewController: DetailViewController? = nil
	
	var votes = [
		["name": "Felix Cat", "file": "cat.png", "bio": "" ],
		["name": "Lungren Dolphin", "file": "dolphin.png", "bio": "" ],
		["name": "Snoop Dog", "file": "dog.png", "bio": "" ],
	]
	
	var objects =
	
		[
			["name": "Felix Cat", "file": "cat.png", "bio": "" ],
			["name": "Lungren Dolphin", "file": "dolphin.png", "bio": "" ],
			["name": "Snoop Dog", "file": "dog.png", "bio": "" ],
			["name": "Koko Gorilla", "file": "gorilla.png", "bio": "" ],
			["name": "Wilbur Horse", "file": "horse.png", "bio": "" ],
			["name": "Porky Pig", "file": "pig.png", "bio": "" ],
			["name": "Roger Rabbit", "file": "rabbit.png", "bio": "" ],
			["name": "Ratatouille", "file": "rat.png", "bio": "" ],
			["name": "Buto Rhinoceros", "file": "rhinoceros.png", "bio": "" ],
			["name": "Tony Tiger", "file": "tiger.png", "bio": "" ],
	]


	// DRAG OUT OF TABLE VIEW …
	
	func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {

		if indexPath.section == 1 {
			let dict = objects[indexPath.row]
			
			for vote in votes {
				if vote["name"] == dict["name"] {
					return []						// EARLY EXIT - CAN'T VOTE MORE THAN ONCE, SO NO DRAGGING OUT
				}
			}
			let itemProvider = NSItemProvider(object: dict["name"]! as NSString)
			let dragItem = UIDragItem(itemProvider: itemProvider)
			dragItem.localObject = dict
			return [dragItem]
		}
		return []
	}
	
	// OR COLLECTIONVIEW …
	
	func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
		
		
		if votes.count > indexPath.row {
			let dict = votes[indexPath.row]
			let itemProvider = NSItemProvider(object: dict["name"]! as NSString)
			let dragItem = UIDragItem(itemProvider: itemProvider)
			dragItem.localObject = dict
			return [dragItem]
		}
		return []
	}

	// DROP INTO COLLECTION VIEW … to add a vote.  SHOULD HANDLE INTRA-COLLECTION MOVE BUT NOTHING HAPPENS!
	
	func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
		
		let destinationIndexPath: IndexPath

		if let indexPath = coordinator.destinationIndexPath {
			destinationIndexPath = indexPath
		} else {
			let section = tableView.numberOfSections - 1
			let row = tableView.numberOfRows(inSection: section)
			destinationIndexPath = IndexPath(row: row, section: section)
		}

		for (index, item) in coordinator.items.enumerated()
		{
			//Destination index path for each item is calculated separately using the destinationIndexPath fetched from the coordinator
			let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
			let localObject = item.dragItem.localObject as! [String:String]
			
			var destRow = destinationIndexPath.row

			
			
			if item.sourceIndexPath != nil && item.sourceIndexPath?.section == 0
			{
				// from VOTES into VOTES … rearrange!
				let sourceRow = item.sourceIndexPath!.row
				if sourceRow == destRow // possible????
					|| (sourceRow >= votes.count - 1  && destRow >= votes.count) {
					// do nothing if moving last one to higher row
					print("not incrementing")
					
				}
				else
				{
					print("Source = \(sourceRow) Dest = \(destRow) Count = " + String(votes.count))
					if (destRow >= votes.count) {
						destRow = votes.count - 1
					}

					let removed = votes.remove(at:sourceRow)
					votes.insert(removed, at: destRow)
				}
			
			}
			else
			{
				// from CANDIDATES into VOTES - insert, possibly lop off the end to keep at 3
				if destRow > votes.count {
					destRow = votes.count
				}
				votes.insert(localObject, at: destRow)
				if votes.count > 3 {
					votes.removeLast(votes.count - 3)
				}
			}
			
			self.collectionView?.reloadData()
			self.tableView?.reloadData()			// also reload table view since display will be affected

		}
	}
	
	// OR TABLEVIEW … (to remove from vote). SHOULD HANDLE INTRA-TABLEVIEW, BUT NOTHING HAPPENS.
	
	func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator ) {
		
		let destinationIndexPath: IndexPath

		if let indexPath = coordinator.destinationIndexPath {
			destinationIndexPath = indexPath
		} else {
			let section = tableView.numberOfSections - 1
			let row = tableView.numberOfRows(inSection: section)
			destinationIndexPath = IndexPath(row: row, section: section)
		}

		for (index, item) in coordinator.items.enumerated()
		{
			//Destination index path for each item is calculated separately using the destinationIndexPath fetched from the coordinator
			let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
			let localObject = item.dragItem.localObject as! [String:String]
			let name = localObject["name"]
			// We don't really care where it was dropped; if it came from collection view, we are throwing it away.
			
			var i = 0, foundIndex = -1
			for vote in votes {
				if vote["name"] == name {
					foundIndex = i
					break
				}
				i += 1
			}
			if (foundIndex >= 0) {
				votes.remove(at: foundIndex)
				self.collectionView?.reloadData()
				self.tableView?.reloadData()			// also reload table view since display will be affected
			}
		}
		
	}

	
	func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal
	{
		if session.localDragSession != nil
		{
			if collectionView.hasActiveDrag
			{
				// from collection into table
				return UICollectionViewDropProposal(operation: .move, intent: .unspecified)
			}
			else
			{
				// from table into collection
				return UICollectionViewDropProposal(operation: .move, intent: .unspecified)
			}
		}
		// collection into table
		return UICollectionViewDropProposal(operation: .move, intent: .unspecified)
	}

	
	func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
		
		if session.localDragSession != nil
		{
			if tableView.hasActiveDrag
			{
				// from table into collection
				return UITableViewDropProposal(operation: .move, intent: .unspecified)
			}
			else
			{
				// from collection into table
				return UITableViewDropProposal(operation: .move, intent: .unspecified)
			}
		}
		return UITableViewDropProposal(operation: .move, intent: .unspecified)

	}
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		navigationItem.leftBarButtonItem = editButtonItem
		if let split = splitViewController {
		    let controllers = split.viewControllers
		    detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
		}
	
		tableView.dragDelegate = self;
		tableView.dropDelegate = self;
		tableView.dragInteractionEnabled = true

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
				return "Your Vote — Drag candidates below"
		}
	}
	
	override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		
		if (section == 0) {
			//Need to create a label with the text we want in order to figure out height
			let label: UILabel = createFooterLabel(section)
			let size = label.sizeThatFits(CGSize(width: view!.bounds.width, height: CGFloat.greatestFiniteMagnitude))
			let padding: CGFloat = 20.0
			return size.height + padding
		}
		return 0
	}
	
	override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
		if (section == 0) {
			let footerView = UITableViewHeaderFooterView()
			let label = createFooterLabel(section)
			label.autoresizingMask = [.flexibleHeight]
			footerView.addSubview(label)
			return footerView
		}
		return nil
	}
	
	func createFooterLabel(_ section: Int)->UILabel {
		
		if (section == 0) {

			let widthPadding: CGFloat = 20.0
			let label: UILabel = UILabel(frame: CGRect(x: widthPadding, y: 0, width: self.view!.bounds.width - widthPadding*2, height: 0))
			
			label.text = "Vote for your favorite candidate as #1. If you want, vote a second and third choice in case your favorites don’t win. Only rank the candidates you would want to win."
			
			label.numberOfLines = 0;
			label.textAlignment = NSTextAlignment.left
			label.lineBreakMode = NSLineBreakMode.byWordWrapping
			label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
			return label
		}
		return UILabel()
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
			
			let name = objects[indexPath.row] ["name"]
			cell.textLabel!.text = name

			// Check if already voted for; if so, make it look disabled
			var votedAlready = false
			for vote in votes {
				if vote["name"] == name {
					votedAlready = true
					break
				}
			}
			cell.textLabel!.textColor = votedAlready ? .lightGray : .black
			
			if let im = objects[indexPath.row] ["file"] {
				cell.imageView!.image = UIImage(named: im)
				cell.imageView!.alpha = votedAlready ? 0.5 : 1.0
			}
			
			cell.accessoryType = .disclosureIndicator

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
}



extension MasterViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	
	@objc func didPressCloseButton(_ sender : UIButton)
	{
		self.votes.remove(at: sender.tag)
		self.collectionView?.reloadData()
		self.tableView?.reloadData()			// display will also be affected
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		self.collectionView = collectionView		// need to stash this away at some point early
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VoteCell",
													  for: indexPath as IndexPath)
		
		let image:UIImageView = cell.subviews[0].subviews[0] as! UIImageView
		let label:UILabel = cell.subviews[0].subviews[1] as! UILabel
		let closeButton:UIButton = cell.subviews[0].subviews[2] as! UIButton

		if indexPath.row < votes.count {
			let data:Dictionary = votes[indexPath.row]
			
			image.image = UIImage(named:data["file"]!)
			label.text = data["name"]
			closeButton.isHidden = true;			// false --- do I want this at all?
			closeButton.tag = indexPath.row
			closeButton.addTarget(self, action: Selector("didPressCloseButton:"), for: .touchUpInside)
		}
		else
		{
			image.image = UIImage(named:("vote" + String(indexPath.row + 1)))
			label.text = ""
			closeButton.isHidden = true;

		}

		return cell

	}
	
	func collectionView(_ collectionView: UICollectionView,
						numberOfItemsInSection section: Int) -> Int {
		
		return 3
	}
	
}
