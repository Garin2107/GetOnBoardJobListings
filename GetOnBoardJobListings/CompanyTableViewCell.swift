//
//  CompanyTableViewCell.swift
//  GetOnBoardJobListings
//
//  Created by Antonio Garin on 09-04-23.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.contentView.addSubview(companyImage)
		containerView.addSubview(companyLabel)
		containerView.addSubview(companyDetailedLabel)
		self.contentView.addSubview(containerView)
		
		companyImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
		companyImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
		companyImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
		companyImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
		
		containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
		containerView.leadingAnchor.constraint(equalTo: self.companyImage.trailingAnchor, constant: 10).isActive = true
		containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
		containerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
		
		companyLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
		companyLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
		companyLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
		
		companyDetailedLabel.topAnchor.constraint(equalTo:self.companyLabel.bottomAnchor).isActive = true
		companyDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
		companyDetailedLabel.topAnchor.constraint(equalTo:self.companyLabel.bottomAnchor).isActive = true
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	var companyImage: UIImageView = {
		let img = UIImageView()
		img.contentMode = .scaleAspectFit
		img.translatesAutoresizingMaskIntoConstraints = false
		img.layer.cornerRadius = 35
		img.clipsToBounds = true
		return img
	}()
	
	var companyLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textColor = .label
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	var companyDetailedLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.boldSystemFont(ofSize: 14)
		label.textColor = .label
		label.backgroundColor = .label
		label.layer.cornerRadius = 5
		label.clipsToBounds = true
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let containerView: UIView = {
	  let view = UIView()
	  view.translatesAutoresizingMaskIntoConstraints = false
	  view.clipsToBounds = true
	  return view
	}()
}
