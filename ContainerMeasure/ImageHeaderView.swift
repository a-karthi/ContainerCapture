//
//  ImageHeaderView.swift
//  ContainerMeasure
//
//  Created by @karthi on 29/08/22.
//

import Foundation
import UIKit

class ImageHeaderView: UITableViewHeaderFooterView {

    // MARK: - Properties

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    // MARK: - LayoutSubviews

    override func layoutSubviews() {
        super.layoutSubviews()

    }

    // MARK: - Initialization

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setupView()

    }
    
    // MARK: - UI & CONSTRAINTS
    private func setupView() {
        
        self.contentView.backgroundColor = .clear
        
        self.contentView.addSubview(imageView)
        
        self.setupConstraints()
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            
        ])
        
    }

}
