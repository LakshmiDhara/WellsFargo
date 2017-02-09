//
//  Reservation+CoreDataProperties.h
//  WellsfargoReservation
//
//  Created by Lakshmi on 2/8/17.
//  Copyright © 2017 Lakshmi. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Reservation+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Reservation (CoreDataProperties)

+ (NSFetchRequest<Reservation *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *date;
@property (nullable, nonatomic, copy) NSString *duration;
@property (nullable, nonatomic, copy) NSString *partySize;
@property (nullable, nonatomic, copy) NSString *serviceDesc;
@property (nullable, nonatomic, copy) NSString *serviceName;
@property (nullable, nonatomic, copy) NSString *serviceTime;

@end

NS_ASSUME_NONNULL_END
