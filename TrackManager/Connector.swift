//
//  Connector.swift
//  TrackManager
//
//  Created by Thiago Magalhães on 08/03/17.
//  Copyright © 2017 NET. All rights reserved.
//

import Foundation


@objc public protocol Connector {
    
    func id() -> String
    
    func track(_ trackable: Trackable)
}
