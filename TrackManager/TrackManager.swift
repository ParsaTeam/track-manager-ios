//
//  TrackManager.swift
//  TrackManager
//
//  Created by Thiago Magalhães on 22/02/17.
//  Copyright © 2017 NET. All rights reserved.
//

import Foundation

@objc public final class TrackManager: NSObject {
    
    //MARK: Singleton
    
    override private init() { }
    
    static let shared = TrackManager()
    
    //MARK: Properties
    
    var showLogs = true
    
    private var connectors: [Connector] = []

    //MARK: Tracking methods
    
    func track(_ trackable: Trackable, excluding: [String] = []) {
        
        DispatchQueue.global(qos: .background).async {
            
            for connector in self.connectors {
                
                if !excluding.contains(connector.id()) {
                    
                    connector.track(trackable)
                    
                    self.log("Event sent to connector with id \"\(connector.id())\"")
                }
            }
        }
    }
    
    //MARK: Connector handling methods
    
    func add(_ connector: Connector) {
        
        guard (self.connectors.index { $0 == connector }) == nil else {
            
            log("Connector with id \"\(connector.id())\" already added")
            
            return
        }
        
        self.connectors.append(connector)
        
        log("Added connector with id \"\(connector.id())\"")
    }
    
    func remove(_ connector: Connector) {
        
        if let index = (self.connectors.index { $0 == connector }) {
            
            self.connectors.remove(at: index)
            
            log("Removed connector with id \"\(connector.id())\"")
            
        } else {
            
            log("Connector with id \"\(connector.id())\" not found")
        }
    }
    
    //MARK: Logging methods
    
    private func log(_ text: String) {
        
        guard self.showLogs else { return }
        
        print(text)
    }
}

public protocol Connector {
    
    func id() -> String
    
    func track(_ trackable: Trackable)
}

func ==(lhs: Connector, rhs: Connector) -> Bool {
    
    return lhs.id() == rhs.id()
}
