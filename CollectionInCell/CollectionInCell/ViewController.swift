//
//  ViewController.swift
//  CollectionInCell
//
//  Created by Abhishek on 30/05/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

struct CellGenericModel {
    var text: String
    var isSelected:Bool
}

struct CellSuperModel {
    var topItem: [CellGenericModel]
}

class ViewController: UIViewController {

    @IBOutlet weak var mTableView: UITableView!
    
    var tableArray: [CellSuperModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpView() {
        mTableView.delegate = self
        mTableView.dataSource = self
        
        let array1 = [CellGenericModel(text: "Top 1", isSelected: false),
                      CellGenericModel(text: "Top 2", isSelected: false),
                      CellGenericModel(text: "Top 3", isSelected: false)]
        
        let array2 = [CellGenericModel(text: "Mid 1", isSelected: false),
                      CellGenericModel(text: "Mid 2", isSelected: false),
                      CellGenericModel(text: "Mid 3", isSelected: false)]
        
        let array3 = [CellGenericModel(text: "Bottom 1", isSelected: false),
                      CellGenericModel(text: "Bottom 2", isSelected: false),
                      CellGenericModel(text: "Bottom 3", isSelected: false)]
        
        let superModel1 = CellSuperModel(topItem: array1)
        let superModel2 = CellSuperModel(topItem: array2)
        let superModel3 = CellSuperModel(topItem: array3)
        
        tableArray = [superModel1, superModel2, superModel3]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CVTableViewCell") as! CVTableViewCell
//        let modelArray = tableArray?[indexPath.row]
        cell.configure(item: tableArray?[indexPath.row])
//        cell.collectionArray = modelArray?.topItem
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tableArray?.count)!
    }
}

