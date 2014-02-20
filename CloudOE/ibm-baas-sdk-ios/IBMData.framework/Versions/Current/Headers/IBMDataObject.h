//-------------------------------------------------------------------------------
// IBM Confidential OCO Source Materials
// XXXX-XXX Copyright IBM Corp. 2013
// The source code for this program is not published or otherwise
// divested of its trade secrets, irrespective of what has
// been deposited with the U.S. Copyright Office.
//-------------------------------------------------------------------------------
//
//  IBMDataObject.h
//  IBMData iOS SDK

#import <IBMData/IBMDataService.h>
#import <IBMData/IBMDataConstants.h>

#ifndef NS_ENUM
#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
#endif

@class IBMDataObject;
@class IBMQuery;

/** Specifies the type of conflict detected by the MBaaS */
typedef NS_ENUM(NSInteger, IBMDataObjectConflictType) {
	/** The version of the object in the MBaaS is more recent than the local version */
	IBMDataObjectConflictType_NewUpdates,
	/** The object in the MBaaS has been deleted */
	IBMDataObjectConflictType_Deleted
};

//////////////////////////////////////////////////////////////////////////////////////////
//
//	IBMDataObjectDelegate
//

/**
 The delegate for the IBMDataObject class will receive notification of data object events for all data objects managed by the MBaaS for this application.  The primary reason to implement this delegate is to respond to save conflict events detected by the MBaaS.

 The default conflict resolution policy implemented by the MBaaS:

 - Local changes can only be made to either a newly created or fetched object
 - If the MBaaS detects a save to an older version of the object, it aborts the save and returns the latest copy of the object
 - Upon receiving a conflict event, the MBaaS framework will revert the object to the MBaaS version and optionally report a conflict event with (MBaaS version, attempted saves, and any dirty changes) to registered delegates

 The app developer can choose to implement a class that conforms to the IBMDataObjectDelegate protocol and register it with the data object service.  There are a number of data object related events that can be caught by registering an object delegate.  An object delegate is registered with the IBMDataObject class, and receives object events for all IBMDataObjects for the application.
*/

@protocol IBMDataObjectDelegate

/**---------------------------------------------------------------------------------------
 * @name Handle conflicts in object data
 * ---------------------------------------------------------------------------------------
 */

/** Tells the delegate that a save for the object failed due to a save conflict detected by the MBaaS.

 This method is used to respond to save conflict events detected by the MBaaS.
 This method can be used to implement a custom conflict resolution policy.

 @param obj The object that encountered save conflicts
 @param type The type of conflict encountered
 @param unsavedFields A dictionary of the attribute names and values that were requested to be saved but were not saved due to the conflict.
 @param dirtyFields A dictionary of attribute names and values that were modified in the local object since the last save request was issued.
 */
- (void)saveConflictFor:(IBMDataObject *)obj
				 ofType:(IBMDataObjectConflictType)type
		withSavedValues:(NSDictionary *)unsavedFields
		withDirtyValues:(NSDictionary *)dirtyFields;

@optional
/** Tells the delegate that a save for the object completed successfully.

 @param obj The object that was saved.
 */
- (void)saveSuccessFor:(IBMDataObject *)obj;

@end

//////////////////////////////////////////////////////////////////////////////////////////
//
//	IBMDataObject
//

/**
 MBaaS objects are entities that can be created, fetched, modified, saved and destroyed by application code.
 These objects contain any number of attributes that can be set and read by the application code.
 Object attributes are identified by an attribute name, which is an arbitrary string.
 The value for an attribute can be an NSNumber, NSString, NSArray of allowable types,
 or NSDictionary with string keys and values of allowable types.
 No other types are permitted for attribute values.
 The IBMDataObject class provides methods to read and write attributes by attribute name.

 MBaaS objects can be created by the application running on one device, saved to the MBaaS, and then
 retrieved through queries performed by the application running on the same or different devices.
 Changes to an object must be explicitly saved by the application to be stored in the MBaaS.
 Once a save is complete, the object data will be stored by the MBaaS in a manner
 that persists across application restarts even during disconnected use.

 No schema is defined for these objects other than those attributes needed by the system to maintain identity
 and consistency of the objects with the MBaaS.
 To help organize these arbitrary objects into groups, all objects have a classname.
 The classname is an arbitrary string that the application can use to group objects with common sets of attributes.

 #### Creating New Objects:
		IBMDataObject *obj = [IBMDataObject objectOfClass:@"Restaurant"];

 #### Reading Attribute Values in the Object:
		id type = [obj objectForKey:@"Type"];
		id name = [obj objectForKey:@"Name"];

 #### Setting Attribute Values within the Object:
		[obj setObject:@"Italian" forKey:@"Type"];
		[obj setObject:@"Noodle Factory" forKey:@"Name"];

 #### Saving Changes to the Object to the MBaaS:
		[obj saveInBackgroundWithCallback:^(NSError *error, id obj) {
			if ( !error ) {
				NSLog(@"Saved");
			} else {
				NSLog(@"Error: %@", error);
			}
		}];

 ### Subclassing Notes

 An application can create a subclass of the IBMDataObject class.  The most common purpose for subclassing
 IBMDataObject is to create an object *specialization*, which has a specific classname and may contain properties
 that are stored into the underlying IBMDataObject through dynamic property synthesis.

 See IBMDataObjectSpecialization for more information.
 */

@interface IBMDataObject : NSObject

/**---------------------------------------------------------------------------------------
 * @name Creating Objects
 * ---------------------------------------------------------------------------------------
 */

/** Creates and returns an object with the specified class name.

 This is the designated initializer for this class.

 @param classname The class name
 @return (IBMDataObject *) The created object
 */
+ (instancetype)objectOfClass:(NSString *)classname;

/** Initializes and returns an object with the specified class name.

 This method is the designated initializer for IBMDataObject.

 @param classname The class name
 @return (IBMDataObject *) The initialized object
 */
- (instancetype)initWithClass:(NSString *)classname;

/**---------------------------------------------------------------------------------------
 * @name Getting and Setting Attributes
 * ---------------------------------------------------------------------------------------
 */

/** A string that uniquely identifies this object. (read-only) */
@property (nonatomic, readonly) NSString		*objectId;
/** The class name of the object specified when the object was created. (read-only) */
@property (nonatomic, readonly) NSString		*className;

/** Returns the value for the attribute identified by the specified key.

 This method is used to read an attribute value of the object.  The key is the attribute name.

 @param key The name of the attribute to be read
 @return (id) The value for this key
 */
- (id)objectForKey:(NSString *)key;

/** Sets the value of an attribute of the receiver identified by the specified key.

 This method is used to set an attribute value of the object.  The key is the attribute name.

 @param obj The value to be written for the specified attribute
 @param key The name of the attribute to be written
 @return (void)
 */
- (void)setObject:(id)obj forKey:(NSString *)key;

/**---------------------------------------------------------------------------------------
 * @name Saving, Refresing, and Deleting an Object
 * ---------------------------------------------------------------------------------------
 */

/** Initiate a save of any locally modified attribute values to the MBaaS.

 If the client is disconnected, multiple saves will be combined and sent as one when
 the client is able to connect to the MBaaS

 @param cb The block to call when complete.  Arguments are (NSError *error, id obj)
 */
- (void)saveInBackgroundWithCallback:(IBMObjectResult)cb;

/** Initiate a refresh of the data for an object from the MBaaS.

 @param cb The block to call when complete.  Arguments are (NSError *error, id obj)
 */
- (void)refreshInBackgroundWithCallback:(IBMObjectResult)cb;

/** Initiate a delete of an object in the MBaaS.

 @param cb The block to call when complete.  Arguments are (NSError *error, id obj)
 */
- (void)deleteInBackgroundWithCallback:(IBMObjectResult)cb;

/**---------------------------------------------------------------------------------------
 * @name Creating a Query
 * ---------------------------------------------------------------------------------------
 */

/** Returns a query to fetch this object by its objectId.

 @return (IBMQuery *) The query for this object
 */
- (IBMQuery *)query;

/**---------------------------------------------------------------------------------------
 * @name Registering an MBaaS ObjectDelegate
 * ---------------------------------------------------------------------------------------
 */

/** Register a delegate that conforms to the IBMDataObjectDelegate protocol for all IBMDataObjects.

 @param delegate The delegate instance
 @return void
 */
+ (void)registerObjectDelegate:(id<IBMDataObjectDelegate>)delegate;

/** Unregister a delegate for all IBMDataObjects.

 @param delegate The delegate instance
 @return void
 */
+ (void)unregisterObjectDelegate:(id<IBMDataObjectDelegate>)delegate;

/**---------------------------------------------------------------------------------------
 * @name Implementing a Custom Conflict Resolution Policy
 * ---------------------------------------------------------------------------------------
 */

/** Reapply a set of changes to an object that were made locally but discarded due to a conflict detected by the MBaaS.

 This method is used by a registered IBMDataObjectDelegate to implement a custom conflict resolution
 policy in the saveConfictFor:ofType:withSavedValues:withDirtyValues: delegate method.

 @param unsavedFields A dictionary of pending saves to the object's attributes
 @param dirtyFields A dictionary of changes to an object's attributes that were not specifically saved
 @return BOOL Indicated whether the saves and dirty values could be reapplied
 */
- (BOOL)reapplySaves:(NSDictionary *)unsavedFields andDirty:(NSDictionary *)dirtyFields;

@end
