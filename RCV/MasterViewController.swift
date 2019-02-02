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
	var objects = [Any]()


	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		navigationItem.leftBarButtonItem = editButtonItem
		if let split = splitViewController {
		    let controllers = split.viewControllers
		    detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
		}
		
		
		objects.append("Cheetah")
		objects.append("Leopard")
		objects.append("Lynx")
		objects.append("Snow Leopard")
		objects.append("Yosemite")

	}

	override func viewWillAppear(_ animated: Bool) {
		clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
		super.viewWillAppear(animated)
	}

	@objc
	func insertNewObject(_ sender: Any) {
		objects.insert(NSDate(), at: 0)
		let indexPath = IndexPath(row: 0, section: 0)
		tableView.insertRows(at: [indexPath], with: .automatic)
	}

	// MARK: - Segues

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showDetail" {
		    if let indexPath = tableView.indexPathForSelectedRow {
		        let object = objects[indexPath.row] as! NSDate
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
	
	override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String {
	
		switch(section) {
		case 1:
			return "Vote for your favorite candidate as #1. If you want, vote a second and third choice in case your favorites don’t win. Only rank the candidates you would want to win."
		default:
			return "This list of candidates was provided in an arbitrary order."
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
			
			let object = objects[indexPath.row] as! String
			cell.textLabel!.text = object
			return cell


		default:

			let cell = tableView.dequeueReusableCell(withIdentifier: "VotingCell", for: indexPath)
			
			cell.textLabel!.text = "TK"
			return cell

		}

		
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

