
@interface LSApplicationWorkspace : NSObject  {
    
}


+ (id)defaultWorkspace;
- (void)_LSClearSchemaCaches;
- (_Bool)_LSPrivateRebuildApplicationDatabasesForSystemApps:(_Bool)arg1 internal:(_Bool)arg2 user:(_Bool)arg3;
- (void)clearCreatedProgressForBundleID:(id)arg1;
- (_Bool)installPhaseFinishedForProgress:(id)arg1;
- (id)installProgressForApplication:(id)arg1 withPhase:(unsigned long long)arg2;
- (void)removeInstallProgressForBundleID:(id)arg1;
- (id)installProgressForBundleID:(id)arg1 makeSynchronous:(unsigned char)arg2;
- (id)deviceIdentifierForVendor;
- (id)deviceIdentifierForAdvertising;
- (void)_clearCachedAdvertisingIdentifier;
- (void)clearAdvertisingIdentifier;
- (_Bool)invalidateIconCache:(id)arg1;
- (_Bool)updateSINFWithData:(id)arg1 forApplication:(id)arg2 options:(id)arg3 error:(id *)arg4;
- (_Bool)unregisterPlugin:(id)arg1;
- (_Bool)registerPlugin:(id)arg1;
- (_Bool)unregisterApplication:(id)arg1;
- (_Bool)registerApplication:(id)arg1;
- (_Bool)registerApplicationDictionary:(id)arg1;
- (_Bool)registerApplicationDictionary:(id)arg1 withObserverNotification:(unsigned long long)arg2;
//- (_Bool)uninstallApplication:(id)arg1 withOptions:(id)arg2 usingBlock:(CDUnknownBlockType)arg3;
- (_Bool)uninstallApplication:(id)arg1 withOptions:(id)arg2;
//- (_Bool)installApplication:(id)arg1 withOptions:(id)arg2 error:(id *)arg3 usingBlock:(CDUnknownBlockType)arg4;
//- (_Bool)installApplication:(id)arg1 withOptions:(id)arg2 error:(id *)arg3;
- (_Bool)installApplication:(id)arg1 withOptions:(id)arg2;
- (_Bool)getClaimedActivityTypes:(id *)arg1 domains:(id *)arg2;
- (id)privateURLSchemes;
- (id)publicURLSchemes;
- (_Bool)applicationIsInstalled:(id)arg1;
- (id)allApplications;
- (id)unrestrictedApplications;
- (id)placeholderApplications;
- (id)allInstalledApplications;
- (id)installedPlugins;
- (id)installedVPNPlugins;
//- (void)enumerateBundlesOfType:(unsigned long long)arg1 usingBlock:(CDUnknownBlockType)arg2;
- (id)operationToOpenResource:(id)arg1 usingApplication:(id)arg2 userInfo:(id)arg3;
- (id)operationToOpenResource:(id)arg1 usingApplication:(id)arg2 uniqueDocumentIdentifier:(id)arg3 userInfo:(id)arg4;
- (id)operationToOpenResource:(id)arg1 usingApplication:(id)arg2 uniqueDocumentIdentifier:(id)arg3 userInfo:(id)arg4 delegate:(id)arg5;
- (id)operationToOpenResource:(id)arg1 usingApplication:(id)arg2 uniqueDocumentIdentifier:(id)arg3 sourceIsManaged:(_Bool)arg4 userInfo:(id)arg5 delegate:(id)arg6;
- (_Bool)openSensitiveURL:(id)arg1 withOptions:(id)arg2;
- (_Bool)openURL:(id)arg1;
- (_Bool)openURL:(id)arg1 withOptions:(id)arg2;
- (_Bool)openApplicationWithBundleID:(id)arg1;
- (id)URLOverrideForURL:(id)arg1;
- (id)applicationsAvailableForHandlingURLScheme:(id)arg1;
- (id)applicationsAvailableForOpeningDocument:(id)arg1;
- (id)pluginsWithIdentifiers:(id)arg1 protocols:(id)arg2 version:(id)arg3;
//- (id)pluginsWithIdentifiers:(id)arg1 protocols:(id)arg2 version:(id)arg3 withFilter:(CDUnknownBlockType)arg4;
//- (id)pluginsWithIdentifiers:(id)arg1 protocols:(id)arg2 version:(id)arg3 applyFilter:(CDUnknownBlockType)arg4;
- (id)applicationsOfType:(unsigned long long)arg1;
- (id)applicationForUserActivityDomainName:(id)arg1;
- (id)applicationForUserActivityType:(id)arg1;
- (id)applicationsWithExternalAccessoryProtocols;
- (id)applicationsWithVPNPlugins;
- (id)applicationsWithSettingsBundle;
- (id)applicationsWithAudioComponents;
- (id)applicationsWithUIBackgroundModes;
- (id)directionsApplications;
- (id)applicationForOpeningResource:(id)arg1;
- (void)removeObserver:(id)arg1;
- (void)addObserver:(id)arg1;
- (id)delegateProxy;
- (id)remoteObserver;
- (_Bool)establishConnection;
- (void)getKnowledgeUUID:(id *)arg1 andSequenceNumber:(id *)arg2;

@end
