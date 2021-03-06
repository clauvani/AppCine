//
//  PeliculasViewController2.swift
//  AppCine
//
//  Created by B303-24 on 10/11/16.
//  Copyright © 2016 B303-24. All rights reserved.
//

import UIKit

class PeliculasViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate
    
{
    @IBOutlet weak var colPeliculas: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var arrayPeliculas = NSMutableArray()
    
    var arrayPeliculasTbl = NSMutableArray() {
        
        didSet{
            self.colPeliculas.reloadData()
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.characters.count == 0 {
            self.arrayPeliculasTbl = self.arrayPeliculas}
            
        else {
            let predicado = NSPredicate(format:"pelicula_nombre CONTAINS[c] %@", searchText)
            let arrayResultado = NSMutableArray(array: self.arrayPeliculas.filtered(using: predicado))
            self.arrayPeliculasTbl = arrayResultado
        }
        
        
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayPeliculasTbl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "PeliculaCollectionViewCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PeliculaCollectionViewCell
        
        cell.objPelicula = self.arrayPeliculasTbl[(indexPath as NSIndexPath).item] as? Pelicula
        cell.actualizarData()
        
        return cell
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let anchoPantalla = UIScreen.main.bounds.size.width
        let anchoCelda = (anchoPantalla - 30)/2
        let altoCelda = anchoCelda / 0.604
        
        return CGSize(width: CGFloat(anchoCelda), height: CGFloat(altoCelda))
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
        
        let objPelicula = self.arrayPeliculasTbl[(indexPath as NSIndexPath).item] as! Pelicula
        self.performSegue(withIdentifier: "DetallePeliculaViewController", sender: objPelicula)
    }

     override func viewDidLoad()
    {
        
        PeliculaBC.listarPeliculas{ (arrayPeliculas) in
            self.arrayPeliculas = arrayPeliculas
            self.arrayPeliculasTbl = arrayPeliculas
        }
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "DetallePeliculaViewController"
        {
            let controller = segue.destination as! DetallePeliculaViewController
            controller.objPelicula = sender as! Pelicula
            
        }
    }
}
