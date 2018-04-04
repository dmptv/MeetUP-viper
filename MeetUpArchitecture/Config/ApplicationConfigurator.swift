//
//  ApplicationConfigurator.swift
//  MeetUpArchitecture
//
//  Created by 123 on 12.02.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

final class ApplicationConfigurator {
    
    weak var feedVC: MeetupFeedViewController?
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        let feedVC  = MeetupFeedViewController()
        let feedNavCtrl = UINavigationController(rootViewController: feedVC)
        window.rootViewController  = feedNavCtrl
        
        self.feedVC = feedVC
        configure()
    }
    
    fileprivate func configure() {
        let locationService = LocationService()
        let meetupService = MeetupService()
        
        let dataManager = MeetupFeedDataManager(meetupService: meetupService, locationService: locationService)
        let interactor = MeetupFeedInteractor()
        interactor.dataManager = dataManager
        interactor.delegateOutput = feedVC
        
        feedVC?.interactor = interactor
    }
}
