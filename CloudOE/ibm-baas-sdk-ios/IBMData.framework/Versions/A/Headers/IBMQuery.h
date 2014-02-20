//-------------------------------------------------------------------------------
// IBM Confidential OCO Source Materials
// XXXX-XXX Copyright IBM Corp. 2013
// The source code for this program is not published or otherwise
// divested of its trade secrets, irrespective of what has
// been deposited with the U.S. Copyright Office.
//-------------------------------------------------------------------------------
//
//  IBMQuery.h
//  IBMData iOS SDK

#import <IBMData/IBMDataService.h>

/** The IBMQuery class represents queries for objects stored in the MBaaS.
 */

@interface IBMQuery : NSObject

/**---------------------------------------------------------------------------------------
 * @name Getting Query Attributes
 * ---------------------------------------------------------------------------------------
 */

/** @return The className for a queryForClass type query.
 */
@property (nonatomic, readonly) NSString			*className;

/** @return The objectId for a queryForObjectId type query.
 */
@property (nonatomic, readonly) NSString			*objectId;

/**---------------------------------------------------------------------------------------
 * @name Creating Queries
 * ---------------------------------------------------------------------------------------
 */

/** Creates and returns a query that will match against all objects with the specified class name.
 
 @param classname The class name for the objects being sought
 @return (IBMQuery *)
 */
+(IBMQuery *)queryForClass:(NSString *)classname;

/** Creates and returns a query for a specific object (by object id).
 
 @param objectId The objectId for the object being sought
 @return (IBMQuery *)
 */
+(IBMQuery *)queryForObjectId:(NSString *)objectId;

/**---------------------------------------------------------------------------------------
 * @name Adding a Condition to a Query
 * ---------------------------------------------------------------------------------------
 */

/** Specify an equals condition against one of the fields in the object
 
 @param key The name of the attribute to compare against
 @param value The value to compare with the attribute value
 @return void
 @warning For MVP we only support the equals condition but more can be added as needed
 */
- (void)whereKey:(NSString *)key equalTo:(id)value;

/**---------------------------------------------------------------------------------------
 * @name Issuing a Query
 * ---------------------------------------------------------------------------------------
 */

/** Issue the query to the MBaaS.  The callback block will be invoked when the results are returned from the MBaaS.
 
 @param block The callback block to be invoked when the query is complete.  The block takes parameters (NSError *error, NSArray *array) where array holds all objects matching the query.
 @return void
 */
- (void)findObjectsInBackgroundWithBlock:(IBMQueryResult)block;

@end
