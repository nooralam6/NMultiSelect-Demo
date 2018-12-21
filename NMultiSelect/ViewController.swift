//
//  ViewController.swift
//  NMultiSelect
//
//  Created by ITRS-676 on 12/21/18.
//  Copyright © 2018 Sunday Mobility. All rights reserved.
//

import UIKit

struct Topic {
    let id: Int
    let name: String
    var selected: Bool
}

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    var topics = [Topic]()
    var selectedTopics = [Topic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...100 {
            let t = Topic(id: i, name: "Topic \(i)", selected: false)
            topics.append(t)
        }
    }

    @IBAction func selectTopicTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NMultipleSelectViewController") as! NMultipleSelectViewController
        let nvc = UINavigationController(rootViewController: vc)
        
        vc.array = topics.compactMap{ $0.name }
        vc.isMultiSelect = true
        vc.delegate = self
        vc.selectedArray = topics.compactMap{ $0.selected }
        vc.titleString = "Select Topic"
        vc.tintColor = UIColor.white
        vc.backgroundColor = UIColor.blue
        self.present(nvc, animated: true, completion: nil)
        
    }
    
}

extension ViewController: NMultipleSelectDelegate {
    func selected(index: [Bool]) {
        var string = String()
        
        for i in 0..<index.count {
            if index[i] { string.append(topics[i].name)}
            topics[i].selected = index[i]
        }
        label.text = string
    }
    
    func didSelect(index: Int) {
        topics[index].selected = true
    }
    
    func deselect(index: Int) {
        topics[index].selected = false
    }
}
