//
//  CVTableViewCell.swift
//  CollectionInCell
//
//  Created by Abhishek on 30/05/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

class CVTableViewCell: TableCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
//    var collectionArray: [CellGenericModel]?
    
    var collectionArray: [String]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpCellUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func configure(item: Any?) {
        let array = item as! [String]
        self.collectionArray = array
    }
}

extension CVTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func setUpCellUI() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO
        let cell = collectionView.cellForItem(at: indexPath) as! CCCollectionViewCell
        
        print("Selected Item: \(cell.txtLabel.text) & Row: \(indexPath.row)")
        cell.tapped = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CCCollectionViewCell
        
        print("De-Selected Item: \(cell.txtLabel.text) & Row: \(indexPath.row)")
        cell.tapped = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (collectionArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CCCollectionViewCell", for: indexPath) as! CCCollectionViewCell
        let ob = collectionArray?[indexPath.row]
        cell.txtLabel.text = ob
        
        return cell
    }
    
}
