//
//  ViewController.swift
//  network-practice
//
//  Created by oynasun on 2018/6/19.
//  Copyright © 2018年 oynasun. All rights reserved.
//

import UIKit
import Network

@available(iOS 12.0, *)

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let connection = NWConnection(host: "https://www.baidu.com/", port: .imaps, using: .tls)
        connection.stateUpdateHandler = { (newState) in
            switch newState {
            case .ready:
                print("ready")
            case .waiting(let error):
                print(error)
            case .failed(let error):
                print(error)
            default:
                break
            }
        }
        connection.start(queue: DispatchQueue.global())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

