//
//  Copyright © 2017 Rosberry. All rights reserved.
//

import Foundation

struct Arguments {
    
    var url: URL?
    var tag: String?
    
    init?(arguments: [String]) {
        for (index, argument) in arguments.enumerated() {
            switch argument.lowercased() {
            case "-u", "--url":
                let urlIndex = index + 1
                guard arguments.count > urlIndex else {
                    return nil
                }
                url = URL(string: arguments[urlIndex])
            case "-t", "--tag":
                let tagIndex = index + 1
                guard arguments.count > tagIndex else {
                    return nil
                }
                tag = arguments[tagIndex]
            default: break
            }
        }
    }
    
    static let description: String = {
        return """
Usage: fastfood [options]
  -u, --url:
      URL to a repo contains Fastfile.
  -t, --tag:
      A version of Fastfile. Should be equals to any tag in Fastfile repo.
"""
    }()
}
