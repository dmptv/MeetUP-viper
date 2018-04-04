//
//  MeetupFeedTableDataProvider.swift
//  MeetUpArchitecture
//
//  Created by 123 on 11.02.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

class MeetupFeedTableDataProvider: NSObject, UITableViewDataSource {
    
    var groups: [Group]?
    let backgroundColor: UIColor = .white
    let cellId = "cellId"
    
    func insertNewGroupsInTableView(_ groups: [Group], completion: @escaping VoidCompletion) {
        self.groups = groups
        completion()
    }
    
    func registerCells(for tableView: UITableView) {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}

extension MeetupFeedTableDataProvider {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) 
        
        let group = groups![indexPath.row]
                
        cell.textLabel?.text = group.country + " " + group.city
        return cell
    }
    
}











