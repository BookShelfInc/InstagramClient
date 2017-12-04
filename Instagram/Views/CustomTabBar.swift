//
//  CustomTabBar.swift
//  Instagram
//
//  Created by Mirzhan Gumarov on 12/2/17.
//  Copyright © 2017 Mirzhan Gumarov. All rights reserved.
//

import UIKit

protocol CustomTabBarDataSource {
    func tabBarItemsInCustomTabBar(tabBarItems: CustomTabBar) -> [UITabBarItem]
}

protocol CustomTabBarDelegate {
    func didSelectViewController(tabBarView: CustomTabBar, atIndex index: Int)
}

class CustomTabBar: UIView {
    var dataSource: CustomTabBarDataSource!
    var delegate: CustomTabBarDelegate!
    
    var tabBarItems: [UITabBarItem]!
    var customTabBarItems: [CustomTabBarItem]!
    var tabBarButtons: [UIButton]!
    
    var initialTabBarItemIndex: Int!
    var selectedTabBarItemIndex: Int!
    var slideMaskDelay: Double!
    var slideAnimationDuration: Double!
    
    var tabBarItemWidth: CGFloat!
    var leftMask: UIView!
    var rightMask: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTabBarColor(of color: UIColor){
        self.backgroundColor = color
    }
    
    func setup(){
        tabBarItems = dataSource.tabBarItemsInCustomTabBar(tabBarItems: self)
        
        customTabBarItems = []
        tabBarButtons = []
        
        initialTabBarItemIndex = 1
        
        let containers = createTabBarItemContiner()
        createTabBarItems(containers: containers)
    }
    
    func createTabBarItemContiner() -> [CGRect]{
        var containerArray = [CGRect]()
        
        for index in 0..<tabBarItems.count {
            let tabBarContainer = createTabBarContainer(index)
            containerArray.append(tabBarContainer)
        }
        
        return containerArray 
    }
    
    func createTabBarContainer(_ index: Int) -> CGRect {
        let tabBarContainerWidth = self.frame.width / CGFloat(tabBarItems.count)
        let tabBarContainerRect = CGRect(x: tabBarContainerWidth * CGFloat(index), y: 0, width: tabBarContainerWidth, height: self.frame.height)
        
        return tabBarContainerRect
    }
    
    func createTabBarItemsSelectionOverlay(containers: [CGRect]){
        let overlayColors = [UIColor.red, UIColor.orange, UIColor.yellow]
        
        for index in 0..<tabBarItems.count {
            let container = containers[index]
            
            let view = UIView(frame: container)
            
            let selectedItemOverlay = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
            selectedItemOverlay.backgroundColor = overlayColors[index]
            view.addSubview(selectedItemOverlay)
            self.addSubview(view)
        }
    }
    
    func createTabBarItemsSelectionOverlayMask(containers: [CGRect]){
        tabBarItemWidth = self.frame.width / CGFloat(tabBarItems.count)
        let leftOverlaySlidingMultiplier = CGFloat(initialTabBarItemIndex) * tabBarItemWidth
        let rightOverlaySlidingMultiplier = CGFloat(initialTabBarItemIndex + 1) * tabBarItemWidth
        
        leftMask = UIView(frame: CGRect(x: 0, y: 0, width: leftOverlaySlidingMultiplier, height: self.frame.height))
        leftMask.backgroundColor = UIColor.brown
        rightMask = UIView(frame: CGRect(x: rightOverlaySlidingMultiplier, y: 0, width: tabBarItemWidth * CGFloat(tabBarItems.count - 1), height: self.frame.height))
        rightMask.backgroundColor = UIColor.brown
        
        self.addSubview(leftMask)
        self.addSubview(rightMask)
    }
    
    func createTabBarItems(containers: [CGRect]) {
        var index = 0
        
        for item in tabBarItems { 
            let container = containers[index]
            
            let customTabBarItem = CustomTabBarItem(frame: container)
            customTabBarItem.setup(item)
            
            self.addSubview(customTabBarItem)
            customTabBarItems.append(customTabBarItem)
            
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: container.width, height: container.height))
            button.addTarget(self, action: #selector(barButtonTapped(_:)), for: .touchUpInside)
            
            customTabBarItem.addSubview(button)
            tabBarButtons.append(button)
            
            index += 1
        }
    }
    
    @objc func barButtonTapped(_ sender: UIButton) {
        let index = tabBarButtons.index(of: sender)!
        
        delegate.didSelectViewController(tabBarView: self, atIndex: index)
    }
}
