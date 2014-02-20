=======================================
|Mobile Cloud Services SDK iOS ReadME |
=======================================
# Licensed Materials - Property of IBM
# 5725-I43 (C) Copyright IBM Corp. 2011, 2014. All Rights Reserved.
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.

Build Level: Build_001

Welcome to the Mobile Cloud Services SDK!

- Overview -
This package contains the required native components to interact with Mobile Cloud Services.
Services are associated with a Mobile App Backend. Connectivity and interaction with
these services depends on the applicationId associated with a Mobile App Backend.
The applicationId needed for the configuration.json file can be found on the SDKS tab of your
Mobile App Backend details view.

Visit https://ace.ng.bluemix.net/#/store/appTemplateGuid=mobileBackend for more information 
on using the Mobile App Backend, including sample code. 

- Contents -
IBMCore.framework           - This is the kernel of the SDK and controls connection and plug-in loading and interaction with cloud code (iOS Framework)
IBMCloudCode.framework      - This is the kernel of the SDK and controls connection and plug-in loading and interaction with cloud code (iOS Framework)
IBMPush.framework           - This is the plug-in for push notification support (iOS Framework)
IBMData.framework           - This is the plug-in for cloud data storage (iOS Framework)
configuration.json    		- This is the configuration file for denoting the applicationId
docs/                 		- This directory contains documentation for the kernel and plug-ins

- Supported Levels -
iOS 5.1.1
iOS 6
iOS 6.1
iOS 7

