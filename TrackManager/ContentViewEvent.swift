//
//  ContentViewEvent.swift
//  TrackManager
//
//  Created by Thiago Magalhães on 03/03/17.
//  Copyright © 2017 NET. All rights reserved.
//

import Foundation

@objc public class ContentViewEvent: Event, Trackable {

    let contentId: String
    
    public func event() -> Event {
        
        return self
    }

    required public init(action: String, label: String?, category: String, customAttributes: [String : Any]?, contentId: String) {
        
        self.contentId = contentId
        
        super.init(action: action, label: label, category: category, customAttributes: customAttributes)
    }
}
