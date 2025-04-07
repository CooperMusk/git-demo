//
//  BaseLogicController.swift
//  MyCloudMusic
//
//  Created by mac on 2025/3/5.
//

import UIKit
import TangramKit

class BaseLogicController: BaseCommonController {
    /// 根容器
    var rootContainer: TGBaseLayout!
    
    /// header 容器
    var superHeaderContainer: TGBaseLayout!
    var superHeaderContentContainer: TGBaseLayout!
    
    /// main 容器
    var container: TGBaseLayout!
    
    /// footer 容器
    var superFooterContainer: TGBaseLayout!
    var superFooterContentContainer: TGBaseLayout!
    
    /// frame 容器，一般用来添加占位布局
    var frameContainer: TGBaseLayout!
    
    /// TableView，一行显示一列
    var tableView: UITableView!
    
    lazy var datum: [Any] = {
        var result: [Any] = []
        return result
    }()
    
    
    /// 初始化 RelativeLayout 容器，四边都在安全区内
    func initRelativeLayoutSafeArea() {
        // 初始化根容器
        initLinearLayout()
        // 初始化 header 容器
        initHeaderContainer()
        // 初始化 main 容器
        container = TGRelativeLayout()
        container.tg_width.equal(.fill)
        container.tg_height.equal(.fill)
        container.backgroundColor = .clear
        rootContainer.addSubview(container)
        // 初始化 footer 容器
        initFooterContainer()
    }
    
    /// 初始化垂直方向 LinearLayou t容器，四边都在安全区内
    func initLinearLayoutSafeArea() {
        // 初始化根容器
        initLinearLayout()
        // 初始化 header 容器
        initHeaderContainer()
        // 初始化 main 容器
        container = TGLinearLayout(.vert)
        container.tg_width.equal(.fill)
        container.tg_height.equal(.fill)
        container.backgroundColor = .clear
        rootContainer.addSubview(container)
        // 初始化 footer 容器
        initFooterContainer()
    }
    
    /// 初始化根容器
    func initLinearLayout() {
        rootContainer = TGLinearLayout(.vert)
        rootContainer.tg_width.equal(.fill)
        rootContainer.tg_height.equal(.fill)
        rootContainer.backgroundColor = .clear
        view.addSubview(rootContainer)
    }
    
    /// 头部容器，安全区外，一般用来设置头部到安全区外背景颜色
    func initHeaderContainer() {
        superHeaderContainer = TGLinearLayout(.vert)
        superHeaderContainer.tg_width.equal(.fill)
        superHeaderContainer.tg_height.equal(.wrap)
        superHeaderContainer.backgroundColor = .clear
        
        // 头部内容容器，安全区内
        superHeaderContentContainer = TGLinearLayout(.vert)
        superHeaderContentContainer.tg_height.equal(.wrap)
        superHeaderContentContainer.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.tg_top.equal(TGLayoutPos.tg_safeAreaMargin)
        superHeaderContentContainer.backgroundColor = .clear
        
        superHeaderContainer.addSubview(superHeaderContentContainer)
        rootContainer.addSubview(superHeaderContainer)
    }
    
    func initFooterContainer() {
        superFooterContainer = TGLinearLayout(.vert)
        superFooterContainer.tg_width.equal(.fill)
        superFooterContainer.tg_height.equal(.wrap)
        superFooterContainer.backgroundColor = .clear
        
        // 底部内容容器，安全区内
        superFooterContentContainer = TGLinearLayout(.vert)
        superFooterContentContainer.tg_height.equal(.wrap)
        superFooterContentContainer.tg_leading.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.tg_trailing.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.tg_bottom.equal(TGLayoutPos.tg_safeAreaMargin)
        superFooterContentContainer.backgroundColor = .clear
        
        superFooterContainer.addSubview(superFooterContentContainer)
        rootContainer.addSubview(superFooterContainer)
    }
    
    /// 初始化 TableView，四边都在安全区内
    func initTableViewSafeArea() {
        // 外面添加一层容器，是方便在 TableView 控件前后添加内容
        initLinearLayoutSafeArea()
        
        // TableView
        createTableView()
        
        container.addSubview(tableView)
    }
    
    /// 创建 TableView，不会添加到任何布局
    func createTableView() {
        tableView = ViewFactoryUtil.tableView()
        
        // 需要实现协议 UITableViewDataSource, UITableViewDelegate
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    /// 使用默认分割线
    func initDefaultTableViewDivider() {
        tableView.separatorStyle = .singleLine
    }
    
    /// 占位控件
    lazy var placeholderView: PlaceholderView = {
        let r = PlaceholderView()
        r.hide()

        frameContainer.addSubview(r)
        
        // 添加点击事件
        let g = UITapGestureRecognizer(target: self, action: #selector(placeholderViewClick(_:)))

        // 设置成 false 表示当前控件响应后会传播到其他控件上
        // 如果不设置为false，界面里面的列表控件可能无法响应点击事件
        g.cancelsTouchesInView = false

        r.addGestureRecognizer(g)

        return r
    }()
    
    /// 占位控件点击
    @objc func placeholderViewClick(_ recognizer: UITapGestureRecognizer) {
        loadData(true)
    }
    
    /// 加载数据方法
    /// - Parameter isPlaceholder: 是否是通过 placeholder 控件触发的
    func loadData(_ isPlaceholder: Bool = false) {
        
    }
    
    override func initViews() {
        super.initViews()
        setBackgroundColor(.colorBackground)
    }
    
    
}


// TableView 数据源和代理
extension BaseLogicController: UITableViewDataSource, UITableViewDelegate {
    /// 这个方法返回 datum 列表的 count ，如果返回 3 ，就会调用 3 次下面的方法。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datum.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
