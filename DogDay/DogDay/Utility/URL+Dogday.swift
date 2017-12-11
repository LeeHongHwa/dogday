//
//  URL+Dogday.swift
//  DogDay
//
//  Created by lyhonghwa on 2017. 12. 11..
//  Copyright © 2017년 lyhonghwa. All rights reserved.
//

import UIKit

extension URL {
    public func openURL(viewController: UIViewController) {
        
        guard let hostString = self.host, let host = Host(rawValue: hostString) else { return }
        let completion = {
            viewController.navigationController?.popToViewController(viewController, animated: false)
            
            switch host {
            case .addDay:
                let navigationController = UINavigationController(rootViewController: EmptyViewController())
                viewController.present(navigationController, animated: false, completion: {
                    navigationController.pushViewController(EditViewController(), animated: true)
                })
            case .detail:
                guard let startTimeString = self.queryDictionary?[QueryKey.startTime.rawValue], let startTime = Double(startTimeString), let dogday = DogDays.sharedInstance.dogday(startTime: startTime) else { return }
                let detailViewController = DetailViewController(with: dogday)
                viewController.navigationController?.pushViewController(detailViewController, animated: true)
            }
        }
        guard let presentedViewController = viewController.presentedViewController else {
            completion()
            return
        }
        presentedViewController.dismiss(animated: false,
                                        completion: completion)
    }
}
