//
//  Trackable.swift
//  TrackManager
//
//  Created by Thiago Magalhães on 03/03/17.
//  Copyright © 2017 NET. All rights reserved.
//

import Foundation

@objc public protocol Trackable {
   
    func event() -> Event
}
