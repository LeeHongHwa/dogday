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
        
        guard let path = Path(rawValue: self.path) else { return }
        let completion = {
            viewController.navigationController?.popToRootViewController(animated: false)
            
            switch path {
            case .addDay:
                let navigationController = UINavigationController(rootViewController: EmptyViewController())
                viewController.present(navigationController, animated: false, completion: {
                    viewController.navigationController?.pushViewController(EditViewController(), animated: false)
                })
            case .deatil:
                guard let startTimeString = self.queryDictionary?[QueryKey.startTime.rawValue], let startTime = Double(startTimeString), let dogday = DogDays.sharedInstance.dogday(startTime: startTime) else { return }
                let detailViewController = DetailViewController(with: dogday)
                viewController.navigationController?.pushViewController(detailViewController, animated: false)
            }
        }
        
        viewController.view.window?.rootViewController?.dismiss(animated: false,
                                                                completion: completion)
    }
}
