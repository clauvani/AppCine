//
//  PeliculaCollectionViewCell.swift
//  AppCine
//
//  Created by B303-24 on 10/11/16.
//  Copyright © 2016 B303-24. All rights reserved.
//

import UIKit

class PeliculaCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var imgPelicula2: UIImageView!
    @IBOutlet weak var lblNombrePelicula2: UILabel!
    
    
    var objPelicula : Pelicula?
    
    func actualizarData()
    {
        self.lblNombrePelicula2.text = self.objPelicula?.pelicula_nombre!
        
        CDMImageDownloaded.descargarImagen(enURL: self.objPelicula?.pelicula_urlImagen, paraImageView: self.imgPelicula2, conPlaceHolder: nil) { (esCorrecto, nombreImagen, imagen) in
            
            if self.objPelicula!.pelicula_urlImagen! == nombreImagen {
                self.imgPelicula2.image = imagen
            }
        }
    }
 
    
    override func draw(_ rect: CGRect) {
        
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.masksToBounds = false
    }
    
}