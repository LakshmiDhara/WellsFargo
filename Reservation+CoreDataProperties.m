//
//  Reservation+CoreDataProperties.m
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/20/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Reservation+CoreDataProperties.h"

@implementation Reservation (CoreDataProperties)

+ (NSFetchRequest<Reservation *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Reservation"];
}

@dynamic date;
@dynamic duration;
@dynamic partySize;
@dynamic serviceDesc;
@dynamic serviceName;
@dynamic serviceTime;

@end
