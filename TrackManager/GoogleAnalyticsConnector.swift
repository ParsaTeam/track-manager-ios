//
//  GoogleAnalyticsConnector.swift
//  GoogleAnalyticsConnector
//
//  Created by Thiago Magalhães on 23/02/17.
//  Copyright © 2017 NET. All rights reserved.
//

import Foundation
import GoogleAnalytics

@objc public class GoogleAnalyticsConnector: NSObject, Connector {

    //MARK: Properties
    
    public let tracker: GAITracker?
    
    private let identifier: String
    
    //MARK: Initialization
    
    public required init(trackingId: String, identifier: String) {
        
        if let tracker = GAI.sharedInstance().tracker(withTrackingId: trackingId) {
        
            self.tracker = tracker
            
        } else {
            
            self.tracker = nil
            
            assertionFailure("Could not initialize tracker with id \"\(trackingId)\"")
        }
        
        self.identifier = identifier
    }
    
    //MARK: Connector protocol conformities
    
    public func id() -> String {
        
        return identifier
    }
    
    public func track(_ trackable: Trackable) {
        
        let event = trackable.event()
        
        if let dictionaryBuilder = GAIDictionaryBuilder.createEvent(withCategory: event.category, action: event.action, label: event.label, value: nil) {
            
            let dictionary = dictionaryBuilder.build() as [NSObject : AnyObject]
            
            tracker?.send(dictionary)
        }

    }
}
