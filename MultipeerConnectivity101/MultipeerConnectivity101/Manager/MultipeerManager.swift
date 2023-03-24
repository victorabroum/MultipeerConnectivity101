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
    
    var isHost: Bool = false
    
    var session: MCSession
    var browser: MCBrowserViewController
    var advertiser: MCNearbyServiceAdvertiser
    
    public let myPeerID = MCPeerID(displayName: UIDevice.current.name)
    private let serviceType = "multi-peer"
    
    init() {
        session = .init(
            peer: myPeerID,
            securityIdentity: nil,
            encryptionPreference: .required)
        browser = .init(serviceType: serviceType, session: session)
        advertiser = .init(
            peer: myPeerID,
            discoveryInfo: nil,
            serviceType: serviceType)
    }
    
    public func startBrowser(viewContoller: UIViewController) {
        viewContoller.present(browser, animated: true)
    }
    
    public func startAdvertiser() {
        advertiser.startAdvertisingPeer()
    }
    
    public func send(data: Data) {
        do {
            try session.send(data, toPeers: session.connectedPeers, with: .reliable)            
        } catch { }
    }
}
