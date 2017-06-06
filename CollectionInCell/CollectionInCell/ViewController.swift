//
//  ViewController.swift
//  CollectionInCell
//
//  Created by Abhishek on 30/05/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    var item: Any? {
        
        didSet {
            configure(item: item)
        }
    }
    
    func configure(item: Any?) {
        
    }
}

struct CellGenericModel {
    var text: String
    var isSelected:Bool
}

struct CellSuperModel {
    var topItem: [CellGenericModel]
}

class ViewController: UIViewController {

    @IBOutlet weak var mTableView: UITableView!
    
//    var tableArray: [CellSuperModel]?
        var tableArray: [[String]]?

    
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
        
//        let array1 = [CellGenericModel(text: "Top 1", isSelected: false),
//                      CellGenericModel(text: "Top 2", isSelected: false),
//                      CellGenericModel(text: "Top 3", isSelected: false)]
//        
//        let array2 = [CellGenericModel(text: "Mid 1", isSelected: false),
//                      CellGenericModel(text: "Mid 2", isSelected: false),
//                      CellGenericModel(text: "Mid 3", isSelected: false)]
//        
//        let array3 = [CellGenericModel(text: "Bottom 1", isSelected: false),
//                      CellGenericModel(text: "Bottom 2", isSelected: false),
//                      CellGenericModel(text: "Bottom 3", isSelected: false)]
//        
//        let superModel1 = CellSuperModel(topItem: array1)
//        let superModel2 = CellSuperModel(topItem: array2)
//        let superModel3 = CellSuperModel(topItem: array3)
//        
//        tableArray = [superModel1, superModel2, superModel3]
        
        tableArray = [["21312", "123123"], ["21312", "123123"], ["21312", "123123"]]
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "CVTableViewCell") as! CVTableViewCell
            cell1.configure(item: tableArray?[indexPath.row])
            return cell1
        case 1:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "CCTableViewCell2") as! CCTableViewCell2
            cell2.configure(item: tableArray?[indexPath.row])
            return cell2
        case 2:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "CCTableViewCell3") as! CCTableViewCell3
            cell3.configure(item: tableArray?[indexPath.row])
            return cell3
        default:
            preconditionFailure()
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tableArray?.count)!
    }
}

