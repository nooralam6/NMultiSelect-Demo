//
//  NMultipleSelectViewController.swift
//  NMultiSelect
//
//  Created by ITRS-676 on 12/21/18.
//  Copyright © 2018 Sunday Mobility. All rights reserved.
//

import UIKit

protocol NMultipleSelectDelegate {
    func selected(index: [Bool])
    func didSelect(index: Int)
    func deselect(index: Int)
}

class NMultipleSelectViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var delegate: NMultipleSelectDelegate?
    

    var array = [String]()
    var selectedArray = [Bool]()
    
    var isMultiSelect = Bool()
    var titleString = String()
    var tintColor = UIColor.blue
    var backgroundColor = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsMultipleSelection = isMultiSelect
        self.navigationItem.title = titleString
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 0.8078, blue: 0.9882, alpha: 1.0) /* #00cefc */
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.selected(index: selectedArray)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension NMultipleSelectViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectionCell", for: indexPath) as! NMultipleSelectionTableViewCell
        cell.label.text = array[indexPath.row]
        cell.isSelected = selectedArray[indexPath.row]
        cell.tintColor = UIColor(red: 0, green: 0.8078, blue: 0.9882, alpha: 1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if selectedArray[indexPath.row] {
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        }
    }
}

extension NMultipleSelectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArray[indexPath.row] = !selectedArray[indexPath.row]
        delegate?.didSelect(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectedArray[indexPath.row] = !selectedArray[indexPath.row]
        delegate?.deselect(index: indexPath.row)
    }
}
