//
//  NavigationViewController+UI.swift
//  OlaNavigationExample
//
//  Created by Abhishek Ravi on 12/08/24.
//

import UIKit

extension NavigationViewController {
    
    func setupUI() {
        self.view.addSubview(visualInstruction)
        self.view.addSubview(visualInstructionTitle)
        self.view.addSubview(visualInstructionSubtitle)
            
        self.view.addSubview(bootomView)
        self.view.addSubview(bottomInstructionTitle)
        self.view.addSubview(bottomInstructionSubtitle)
        self.view.addSubview(recenterBtn)
        self.view.addSubview(overviewButton)
        self.view.addSubview(voiceButton)
        
        NSLayoutConstraint.activate([
            visualInstruction.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            visualInstruction.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            visualInstruction.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            visualInstruction.heightAnchor.constraint(equalToConstant: 70),
            
            visualInstructionTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            visualInstructionTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            visualInstructionTitle.topAnchor.constraint(equalTo: self.visualInstruction.topAnchor, constant: 20),
            
            visualInstructionSubtitle.topAnchor.constraint(equalTo: self.visualInstructionTitle.topAnchor, constant: 20),
            visualInstructionSubtitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            visualInstructionSubtitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            bootomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
            bootomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            bootomView.heightAnchor.constraint(equalToConstant: 100),
            bootomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            bottomInstructionTitle.leadingAnchor.constraint(equalTo: self.bootomView.leadingAnchor, constant: 20),
            bottomInstructionTitle.trailingAnchor.constraint(equalTo: self.bootomView.trailingAnchor, constant: -20),
            bottomInstructionTitle.topAnchor.constraint(equalTo: self.bootomView.topAnchor, constant: 20),
            
            bottomInstructionSubtitle.topAnchor.constraint(equalTo: self.bottomInstructionTitle.topAnchor, constant: 20),
            bottomInstructionSubtitle.leadingAnchor.constraint(equalTo: self.bootomView.leadingAnchor, constant: 20),
            bottomInstructionSubtitle.trailingAnchor.constraint(equalTo: self.bootomView.trailingAnchor, constant: -20),
            
            recenterBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            recenterBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100),
            recenterBtn.widthAnchor.constraint(equalToConstant: 50),
            recenterBtn.heightAnchor.constraint(equalToConstant: 50),
            
            overviewButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            overviewButton.topAnchor.constraint(equalTo: self.recenterBtn.bottomAnchor, constant: 20),
            overviewButton.widthAnchor.constraint(equalToConstant: 50),
            overviewButton.heightAnchor.constraint(equalToConstant: 50),
            
            voiceButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            voiceButton.topAnchor.constraint(equalTo: self.overviewButton.bottomAnchor, constant: 20),
            voiceButton.widthAnchor.constraint(equalToConstant: 50),
            voiceButton.heightAnchor.constraint(equalToConstant: 50)

        ])
        
    }
}
