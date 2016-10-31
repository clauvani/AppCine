//
//  Sucursal+CoreDataProperties.swift
//  AppCine
//
//  Created by B303-24 on 31/10/16.
//  Copyright © 2016 B303-24. All rights reserved.
//

import Foundation
import CoreData

extension Sucursal
{

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sucursal>
    {
        return NSFetchRequest<Sucursal>(entityName: "Sucursal");
    }

    @NSManaged public var sucursal_id: String?
    @NSManaged public var sucursal_nombre: String?
    @NSManaged public var horarios: NSSet?

}

// MARK: Generated accessors for horarios
extension Sucursal {

    @objc(addHorariosObject:)
    @NSManaged public func addToHorarios(_ value: Horario)

    @objc(removeHorariosObject:)
    @NSManaged public func removeFromHorarios(_ value: Horario)

    @objc(addHorarios:)
    @NSManaged public func addToHorarios(_ values: NSSet)

    @objc(removeHorarios:)
    @NSManaged public func removeFromHorarios(_ values: NSSet)

}
