//
//  ImageGalleryViewController.swift
//  ImageGalleryApp
//
//  Created by Shaahid shamil on 21/10/24.
//

import UIKit

class ImageGalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    private let viewModel = ImageGalleryViewModel()
    private var collectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()  // Create a refresh control
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSearchBar()
        bindViewModel()
        viewModel.fetchImages()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.frame.size.width / 2) - 10, height: 200)
        layout.minimumInteritemSpacing = 10
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        refreshControl.addTarget(self, action: #selector(refreshImages), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        
        view.addSubview(collectionView)
        
      
        collectionView.isAccessibilityElement = true
        collectionView.accessibilityLabel = "Image Gallery"
        collectionView.accessibilityHint = "Double tap to refresh the images."
    }
    
    private func setupSearchBar() {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        // Accessibility configuration for searchBar
        searchBar.accessibilityLabel = "Search for images"
        searchBar.placeholder = "Enter keywords to search"
    }
    
    private func bindViewModel() {
        viewModel.onImagesFetched = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }
        
        viewModel.onError = { [weak self] error in
            print("Error: \(error)")
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    @objc private func refreshImages() {
        viewModel.fetchImages()  // Fetch images again on refresh
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
        let image = viewModel.image(at: indexPath.row)
        cell.configure(with: image.urls.regular)
        
      
        cell.isAccessibilityElement = true
        cell.accessibilityLabel = "Image \(indexPath.row + 1)"
        cell.accessibilityHint = "Double tap to view image."
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
        viewModel.fetchImages(query: query)
        searchBar.resignFirstResponder()
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        collectionView.backgroundColor = UIColor.systemBackground // Adjust background for dark mode
    }
}
