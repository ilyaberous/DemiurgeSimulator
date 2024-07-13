//
//  ViewController.swift
//  DemiurgeSimulator
//
//  Created by Ilya on 12.07.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: ViewModel
    
    private lazy var button: UIButton = {
        let btt = UIButton(type: .custom)
        btt.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        btt.setTitle(Strings.bttLabel, for: .normal)
        btt.setTitleColor(.white, for: .normal)
        btt.setTitleColor(.lightGray, for: .highlighted)
        btt.setBackgroundColor(.DSPink(), forState: .normal)
        btt.setBackgroundColor(.DSPinkBttHighlighted(), forState: .highlighted)
        btt.constrainHeight(44)
        btt.clipsToBounds = true
        btt.layer.cornerRadius = 4
        btt.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return btt
    }()
    
    private lazy var headerView: UILabel = {
        let header = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
        header.font = .systemFont(ofSize: 24, weight: .bold)
        header.textColor = .white
        header.text = Strings.title
        header.textAlignment = .center
        return header
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = UIColor.white.withAlphaComponent(0)
        tv.showsVerticalScrollIndicator = false
        tv.register(DeadCell.self, forCellReuseIdentifier: DeadCell.identifier)
        tv.register(AliveCell.self, forCellReuseIdentifier: AliveCell.identifier)
        tv.register(LifeCell.self, forCellReuseIdentifier: LifeCell.identifier)
        return tv
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Lifecycle
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.setBackgroundVerticalGradientLayer(topColor: UIColor.DSBackgroundGradientTop(),
                                           bottomColor: UIColor.DSBackgroundGradientBottom())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setStatusBar(backgroundColor: UIColor.DSPink())
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16), size: CGSize(width: view.frame.width, height: 80))
        view.addSubview(button)
        button.anchor(leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))

        view.addSubview(tableView)
        tableView.anchor(top: headerView.bottomAnchor, leading: view.leadingAnchor, bottom: button.topAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 8, left: 16, bottom: 16, right: 16))
    }
    
    // MARK: - Helpers
    
    @objc private func buttonTapped(_ sender: UIButton) {
        viewModel.createRandomCell()
    }
}

// MARK: - TableView Delegate Methods

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - TableView DataSource Methods

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.formattedCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = viewModel.formattedCells[indexPath.row]
        
        if cell == tableView.dequeueReusableCell(withIdentifier: DeadCell.identifier) as? DeadCell {
            return cell
        }
        
        if cell == tableView.dequeueReusableCell(withIdentifier: AliveCell.identifier) as? AliveCell {
            return cell
        }
        
        if cell == tableView.dequeueReusableCell(withIdentifier: LifeCell.identifier) as? LifeCell {
            return cell
        }
        
        return cell
    }
}

// MARK: - ViewModel Delegate Methods

extension MainViewController: ViewModelDelegate {
    func viewModel(wantsToScrollCellsListToTheLastRow row: Int) {
        guard row >= 3 else {
            return
        }
        
        tableView.scrollToRow(at: IndexPath(row: row, section: 0), at: .bottom, animated: true)
    }
    
    func viewModel(wantsToUpdateCellsList cells: [CellState]) {
        tableView.reloadData()
    }
}
