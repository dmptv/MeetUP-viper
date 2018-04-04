//
//  MeetupFeedDataManager.swift
//  MeetUpArchitecture
//
//  Created by 123 on 11.02.2018.
//  Copyright © 2018 123. All rights reserved.
//

import Foundation

final class MeetupFeedDataManager {
    
    fileprivate var meetupService: MeetupService?
    fileprivate var locationService: LocationService?
    
    init(meetupService: MeetupService, locationService: LocationService) {
        self.meetupService = meetupService
        self.locationService = locationService
    }
    
    func searchForGroupNearby(completion: @escaping ( _ groups: [Group]?, _ error: Error?) -> ()) {
        let coordinate = locationService?.coordinate
        
        meetupService?.fetchMeetupGroupInLocation(latitude: coordinate!.latitude,
                                                  longitude: coordinate!.longitude,
                                                  completion:
            { (results, error) in
                guard error == nil else { completion(nil, error); return }
                
                let groups: [Group]? = results?.flatMap { json in self.groupItemFromJSONDictionary(json) }
                //let groups = results?.flatMap(self.groupItemFromJSONDictionary)
                
                completion(groups, nil)
        })
    }
    
    fileprivate func groupItemFromJSONDictionary(_ entry: JSONDictionary) -> Group? {
        guard
            let created = entry["created"] as? Double,
            let city = entry["city"] as? String,
            let country = entry["country"] as? String,
            let keyPhoto = entry["key_photo"] as? JSONDictionary,
            let photoUrl = keyPhoto["photo_link"] as? String,
            let organizerJSON = entry["organizer"] as? JSONDictionary,
            let organizer = organizerItemFromJSONDictionary(organizerJSON)
            else { return nil }
        
        return Group(createdAt: created,
                     photoUrl: URL(string: photoUrl),
                     city: city,
                     country: country,
                     organizer: organizer)
    }
    
    fileprivate func organizerItemFromJSONDictionary(_ entry: JSONDictionary) -> Organizer? {
        guard
            let name = entry["name"] as? String,
            let photo = entry["photo"] as? JSONDictionary,
            let thumbUrl = photo["thumb_link"] as? String
            else { return nil }
        
        return Organizer(name: name,
                         thumbUrl: URL(string: thumbUrl))
    }
}






