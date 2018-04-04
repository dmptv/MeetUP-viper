//
//  MeetupFeedInteractor.swift
//  MeetUpArchitecture
//
//  Created by 123 on 11.02.2018.
//  Copyright © 2018 123. All rights reserved.
//

import Foundation

protocol MeetupFeedInteractorInput {
    func findGroupItemsNearby ()
}

protocol MeetupFeedInteractorOutput {
    func foundGroupItems (_ groups: [Group]?, error: Error?)
}


final class MeetupFeedInteractor: MeetupFeedInteractorInput {
    
    var dataManager: MeetupFeedDataManager?
    
    var delegateOutput: MeetupFeedInteractorOutput?
    
    func findGroupItemsNearby() {
        dataManager?.searchForGroupNearby(completion: { (groups, err) in
                        
            self.delegateOutput?.foundGroupItems(groups, error: err)
          
        })
        
        //        dataManager?.searchForGroupNearby(completion: output!.foundGroupItems)
    }
}










