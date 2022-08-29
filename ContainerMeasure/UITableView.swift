//
//  UITableView.swift
//  ContainerMeasure
//
//  Created by @karthi on 29/08/22.
//

import Foundation
import UIKit

extension UITableViewHeaderFooterView {

    /// Returns an identifier for reuse the ui element tableview header and footer view
    static var reuseIdentifier: String {
        let className = String(describing: self)
        return className
    }
}

extension UITableViewCell {

    /// Returns an identifier for reuse the ui element tableview cell
    static var reuseIdentifier: String! {
        let className = String(describing: self)
        return className
    }
}

extension UITableView {

    /// Setting tableview with basic configuration
    func setupBasicTableView() {

        self.isScrollEnabled = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.alwaysBounceVertical = true
        self.separatorStyle = .none

    }
}

/// My Question answered table view configuration
/// - Parameters:
///   - delegate: Delegate of the tableview
///   - datasource: Datasource of the tableview
/// - Returns: Returns a tableview with the given configuration
public enum TableType {
    case group
    case plain
}

/// Configuring tableview with plain or individual cell views
/// - Parameters:
///   - delegate: Delegate of the tableview
///   - datasource: Datasource of the tableview
/// - Returns: Returns a plain tableview with given configuration
public func customTableView(_ tableType: TableType,
                            _ delegate: UITableViewDelegate,
                            _ datasource: UITableViewDataSource) -> UITableView {
    let tableView = UITableView.init(frame: CGRect.zero, style: tableType == .group ? .grouped : .plain)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.setupBasicTableView()
    tableView.dataSource = datasource
    tableView.delegate = delegate
    return tableView
}

public func basicTableView(_ delegate: UITableViewDelegate,
                            _ datasource: UITableViewDataSource) -> UITableView {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.setupBasicTableView()
    tableView.dataSource = datasource
    tableView.delegate = delegate
    return tableView
}

/// Configuring tableview with plain or individual cell views
/// - Parameters:
///   - delegate: Delegate of the tableview
///   - datasource: Datasource of the tableview
/// - Returns: Returns a plain tableview with given configuration
public func plainTableView(_ delegate: UITableViewDelegate,
                           _ datasource: UITableViewDataSource) -> UITableView {

    let tableView = UITableView.init(frame: CGRect.zero, style: .plain)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.setupBasicTableView()
    tableView.dataSource = datasource
    tableView.delegate = delegate
    return tableView

}

/// Configuring tableview with group of cells
/// - Parameters:
///   - delegate: Delegate of the tableview
///   - datasource: Datasource of the tableview
/// - Returns: Returns a tableview with grouped configuration
public func groupTableView(_ delegate: UITableViewDelegate,
                           _ datasource: UITableViewDataSource) -> UITableView {

    let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.setupBasicTableView()
    tableView.dataSource = datasource
    tableView.delegate = delegate
    return tableView

}

extension UITableView {
    func indexPathExists(indexPath:IndexPath) -> Bool {
        if indexPath.section >= self.numberOfSections {
            return false
        }
        if indexPath.row >= self.numberOfRows(inSection: indexPath.section) {
            return false
        }
        return true
    }
}

extension UIScrollView {

    var isAtTop: Bool {
        return contentOffset.y <= verticalOffsetForTop
    }

    var isAtBottom: Bool {
        return contentOffset.y >= verticalOffsetForBottom
    }

    var verticalOffsetForTop: CGFloat {
        let topInset = contentInset.top
        return -topInset
    }

    var verticalOffsetForBottom: CGFloat {
        let scrollViewHeight = bounds.height
        let scrollContentSizeHeight = contentSize.height
        let bottomInset = contentInset.bottom
        let scrollViewBottomOffset = scrollContentSizeHeight + bottomInset - scrollViewHeight
        return scrollViewBottomOffset
    }

}
extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 1
        messageLabel.textAlignment = .center
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
    }
}
