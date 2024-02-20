public class CustomAssetHandler {
    public static void increaseAsset(list<Asset__c> assetList) {
        set<ID> ids = new set<ID>();
            for(Asset__c a: assetList) {
                ids.add(a.Company_Name__c);
            }
            
            MAP<Id,Company__c> companyList = new MAP<ID,Company__c>([SELECT ID, Asset_Count__c FROM COMPANY__C WHERE ID IN :IDS]);
            
            for(Asset__c a: assetList){
                companyList.get(a.Company_Name__c).Asset_Count__c+=1;
            }
            List<Company__c> ls = companyList.values();
            update ls;
    }
    public static void decreaseAsset(list<Asset__c> assetList) {
        set<ID> ids = new set<ID>();
            for(Asset__c a: assetList) {
                ids.add(a.Company_Name__c);
            }
            
            MAP<Id,Company__c> companyList = new MAP<ID,Company__c>([SELECT ID, Asset_Count__c FROM COMPANY__C WHERE ID IN :IDS]);
            
            for(Asset__c a: assetList){
                companyList.get(a.Company_Name__c).Asset_Count__c-=1;
            }
            List<Company__c> ls = companyList.values();
            update ls;
    }
}