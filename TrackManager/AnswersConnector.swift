//
//  FabricConnector.swift
//  TrackManager
//
//  Created by Thiago Magalhães on 03/03/17.
//  Copyright © 2017 NET. All rights reserved.
//

import Foundation
import Fabric
import Answers

@objc public class AnswersConnector: NSObject, Connector {

    private let identifier: String
    
    //MARK: Custom attribute keys
    
    public let kActionKey = "action"
    
    //MARK: Initialization
    
    public required init(identifier: String) {
        
        Fabric.with([Answers.self])
        
        self.identifier = identifier
    }
    
    //MARK: Connector protocol conformities
    
    public func id() -> String {
        
        return identifier
    }
    
    public func track(_ trackable: Trackable) {
        
        switch trackable.event() {
            
        case let event as ContentViewEvent:
            
            Answers.logContentView(withName: event.label,
                                   contentType: event.category,
                                   contentId: event.contentId,
                                   customAttributes: [kActionKey: event.action])
            
        case let event as LoginEvent:
            
            Answers.logLogin(withMethod: event.action, success: true, customAttributes: nil)
            
        case let event as SearchEvent:
            
            Answers.logSearch(withQuery: event.label, customAttributes: [kActionKey: event.action])
            
        default:
            
            assertionFailure("Unsupported type")
        }
    }
}
