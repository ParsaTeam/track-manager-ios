//
//  Event.swift
//  TrackManager
//
//  Created by Thiago Magalhães on 23/02/17.
//  Copyright © 2017 NET. All rights reserved.
//

import Foundation

@objc public class Event: NSObject {
    
    public let action: String
    public let label: String?
    public let category: String
    public let customAttributes: [String : Any]?
    
    public init(action: String, label: String?, category: String, customAttributes: [String : Any]?) {
        
        self.action = action
        self.label = label
        self.category = category
        self.customAttributes = customAttributes
    }
}
