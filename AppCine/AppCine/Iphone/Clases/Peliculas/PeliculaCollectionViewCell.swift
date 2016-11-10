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
            
            self.imgPelicula2.image = imagen
        }
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    //override func setSelected(_ selected: Bool, animated: Bool)
    //{
    //    super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    //}
    
}
