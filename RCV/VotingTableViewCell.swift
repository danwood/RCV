//
//  VotingTableViewCell.swift
//  RCV
//
//  Created by Dan Wood on 2/2/19.
//  Copyright © 2019 gigliwood. All rights reserved.
//

import UIKit

class VotingTableViewCell: UITableViewCell {

	@IBOutlet weak var collectionView: UICollectionView!

//	@IBOutlet weak var label: UILabel!
//	@IBOutlet weak var image: UIImageView!
//
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	
	func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
		collectionView.delegate = dataSourceDelegate
		collectionView.dataSource = dataSourceDelegate
		collectionView.tag = row
		collectionView.reloadData()
		
		collectionView.dragDelegate = dataSourceDelegate as! UICollectionViewDragDelegate;
		collectionView.dragInteractionEnabled = true

	}
	

}
