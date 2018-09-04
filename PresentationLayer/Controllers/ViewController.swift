//
//  ViewController.swift
//  TestApp
//
//  Created by Oleh Petrunko on 04/09/2018.
//  Copyright © 2018 Seanetix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Private
    fileprivate var dataSource: [Book] = [Book]() {
        didSet { self.tableView.reloadData() }
    }
    fileprivate let bookService: BookService = BookServiceAssembly.bookService()
    fileprivate var pagination = PaginationAssamble.pagination()
    
    fileprivate var showedBook: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBooks()
    }
    
    //MARK: Requests
    fileprivate func getBooks() {
        
        self.pagination.isFetchingData = true
        bookService.get()
            .done { books in
                guard let books = books else { return }
                self.dataSource.append(contentsOf: books)
                
            }.catch { error in
                self.showError( error )
                
            }.finally {
                self.pagination.isFetchingData = false
        }
    }
    
    //MARK: UI
    fileprivate func updateCounter() {
        title = String(format: "%@ %li", "Displyed books", showedBook)
    }
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if showedBook < indexPath.row {
            showedBook = indexPath.row
            updateCounter()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let url = dataSource[indexPath.row].url
        pushWebView(url: url)
    }
    
    fileprivate func pushWebView(url: URL?) {
        
        let webViewVC = WebViewViewController()
        webViewVC.url = url
        navigationController?.pushViewController(webViewVC, animated: true)
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.typeName, for: indexPath)
        configureCell(cell, atIndexPath: indexPath)
        
        return cell
        
    }
    
    fileprivate func configureCell(_ cell: UITableViewCell, atIndexPath indexPath: IndexPath) {
        
        guard let bookCell = cell as? BookTableViewCell else { return }
        let book = dataSource[indexPath.row]
        bookCell.prepareForDisplay(book: book)
    }
}

//MARK: - UIScrollViewDelegate
extension ViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        
        if deltaOffset < 0 && dataSource.count > 0 {
            if pagination.isFetchingData { return }
            
            pagination.page += 1
            let paginationView = PaginationFooterView(frame: .paginationViewFrame)
            tableView.tableFooterView = paginationView
            getBooks()
        }
    }
}

