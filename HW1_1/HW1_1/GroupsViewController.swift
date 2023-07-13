//
//  GroupsViewController.swift
//  HW1_1
//
//  Created by MacBook Pro on 12/07/23.
//

import UIKit
class GroupsViewController : UITableViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        CustomCell1()
    }
}
