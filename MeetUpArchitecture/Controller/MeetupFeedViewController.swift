//
//  ViewController.swift
//  MeetUpArchitecture
//
//  Created by 123 on 11.02.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

class MeetupFeedViewController: UITableViewController {
    
    var dataProvider: MeetupFeedTableDataProvider!
    var interactor: MeetupFeedInteractorInput?
    
    var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupInitialState()
        
        setupActivitiView()
        
        print("*** BACKEND_URL == ", infoForKey("Backend Url") as Any)
    }
    
    // example of .config tutorial
    func infoForKey(_ key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
    }
    
    fileprivate func setupInitialState() {
        title = "Browse Meetup"
        
        dataProvider = MeetupFeedTableDataProvider()
        tableView.dataSource = dataProvider
        tableView.delegate = self
        
        tableView.backgroundColor = dataProvider.backgroundColor
        tableView.refreshControl = refresh
        
        dataProvider.registerCells(for: tableView)
    }
    
    fileprivate func setupActivitiView() {
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.sizeToFit()
        
        var refreshRect = activityIndicatorView.frame
        refreshRect.origin = CGPoint(x: (view.bounds.size.width - activityIndicatorView.frame.width) / 2.0, y: view.frame.midY)
        
        activityIndicatorView.frame = refreshRect
        view.addSubview(activityIndicatorView)
        
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        activityIndicatorView.startAnimating()
        
        // command to interactor - go fetch groups
        interactor?.findGroupItemsNearby()
    }
    
    let refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self,
                          action: #selector(MeetupFeedViewController.refreshColors),
                          for: .valueChanged)
        return refresh
    }()
    
    @objc func refreshColors() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
}

extension MeetupFeedViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension MeetupFeedViewController: MeetupFeedInteractorOutput {
    
    func foundGroupItems(_ groups: [Group]?, error: Error?) {
        guard error == nil else {
            printMine(" *** Error fetching")
            return
        }
        
        self.dataProvider.insertNewGroupsInTableView(groups!, completion: {
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                self.tableView.reloadData()
            }
           
        })
    }
    
}





















