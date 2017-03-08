//
//  PinpointConnector.swift
//  TrackManager
//
//  Created by Thiago Magalhães on 06/03/17.
//  Copyright © 2017 NET. All rights reserved.
//

import Foundation
import AWSCore
import AWSPinpoint

@objc public class PinpointConnector: NSObject, Connector {
    
    private let identifier: String
    
    private let kCategoryKey = "category"
    private let kActionKey = "action"
    private let kLabelKey = "label"
    
    private let tracker: AWSPinpointAnalyticsClient
    
    public required init(identifier: String, region: AWSRegionType, poolId: String) {

        let credentialsProvider = AWSCognitoCredentialsProvider(
            regionType: region,
            identityPoolId: poolId)
        
        let configuration = AWSServiceConfiguration(
            region: region,
            credentialsProvider: credentialsProvider)
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        self.tracker = AWSPinpointAnalyticsClient()
        
        self.identifier = identifier
    }
    
    public func id() -> String {
        
        return identifier
    }
    
    public func track(_ trackable: Trackable) {
        
        let event = trackable.event()
        
        let trackerEvent = self.tracker.createEvent(withEventType: "")
        
        trackerEvent.addAttribute(kCategoryKey, forKey: event.category)
        
        trackerEvent.addAttribute(kActionKey, forKey: event.action)
    
        if let label = event.label {
            
            
            trackerEvent.addAttribute(kLabelKey, forKey: label)
        }
    }
}
