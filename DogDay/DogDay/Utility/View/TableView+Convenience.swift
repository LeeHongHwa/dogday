//
//  TableView+Convenience.swift
//  DogDay
//
//  Created by david on 23/01/2019.
//  Copyright © 2019 lyhonghwa. All rights reserved.
//

import UIKit

protocol TableViewCellType {
    static var identifier: String { get }
}

extension UITableViewCell: TableViewCellType {
    static var identifier: String { return String(describing: self.self) }
}

extension UITableViewHeaderFooterView: TableViewCellType {
    static var identifier: String { return String(describing: self.self) }
}

extension UITableView {
    func register<Cell>(type: Cell.Type, forCellReuseIdentifier reuseIdentifier: String = Cell.identifier) where Cell: UITableViewCell {
        register(type, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func registerNib<Cell>(type: Cell.Type) where Cell: UITableViewCell {
        let identifier = Cell.identifier
        register(UINib(nibName: identifier, bundle: Bundle.main), forCellReuseIdentifier: identifier)
    }
    
    func registerHeaderViewNib<HeaderFooter>(headerView: HeaderFooter.Type) where HeaderFooter: UITableViewHeaderFooterView {
        let identifier = HeaderFooter.identifier
        register(UINib(nibName: identifier, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func dequeue<Cell>(_ reusableCellType: Cell.Type) -> Cell? where Cell: UITableViewCell {
        return dequeueReusableCell(withIdentifier: reusableCellType.identifier) as? Cell
    }
    
    func dequeueHeaderFooterView<HeaderFooter>(_ reusableViewType: HeaderFooter.Type) -> HeaderFooter? where HeaderFooter: UITableViewHeaderFooterView {
        return dequeueReusableHeaderFooterView(withIdentifier: reusableViewType.identifier) as? HeaderFooter
    }
}
