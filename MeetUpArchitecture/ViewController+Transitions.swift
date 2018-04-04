//
//  ViewController+Transitions.swift
//  MeetUpArchitecture
//
//  Created by 123 on 31.03.2018.
//  Copyright © 2018 123. All rights reserved.
//

import UIKit

struct User {}
class ProfileViewController: UIViewController {
    var user: User
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIViewController {
    func openProfile(for user: User) {
        let profileViewController = ProfileViewController(user: user)
        present(profileViewController, animated: true, completion: nil)
    }
}

