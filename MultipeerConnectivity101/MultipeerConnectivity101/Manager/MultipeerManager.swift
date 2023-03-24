//
//  MultipeerManager.swift
//  MultipeerConnectivity101
//
//  Created by Victor Vasconcelos on 24/03/23.
//

import Foundation
import MultipeerConnectivity

class MultipeerManager {
    
    public static let shared = MultipeerManager()
    public static let serviceType = "multi-peer"
    
    public var myPeerID = MCPeerID(displayName: UIDevice.current.name)
    
    public var session: MCSession!
    public var browser: MCBrowserViewController // Host
    public var advertiser: MCNearbyServiceAdvertiser // Join
    
    public init() {
        session = .init(peer: myPeerID,
                        securityIdentity: nil,
                        encryptionPreference: .required)
        browser = .init(
            serviceType: MultipeerManager.serviceType,
            session: session)
        advertiser = .init(
            peer: myPeerID,
            discoveryInfo: nil,
            serviceType: MultipeerManager.serviceType)
    }
    
    public func startBrowser(_ viewController: UIViewController) {
        // O Host começa a procurar
        viewController.present(browser, animated: true)
    }
    
    public func startAdvertiser() {
        // O Client começa a ser enxergado
        advertiser.startAdvertisingPeer()
    }
    
    public func send(_ data: Data) {
        do {
            try session.send(data,
                             toPeers: session.connectedPeers,
                             with: .reliable)
            
        } catch { }
    }
    
}
