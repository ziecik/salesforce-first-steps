public class ClinicianFacilityRelationshipUtil {

    
    @InvocableMethod(label='v2' description='Create records in Clinician_Facility__c' category='Clinician_Facility__c')
    public static void createClinicianFacilityRelationship(List<Id> cliniciansNames) {
        List<Clinician__c> clinicians = [SELECT Name, Specialization__c FROM Clinician__c WHERE Id IN :cliniciansNames];
        List<Facility__c> facilities = [SELECT Name, Specialization__c FROM Facility__c];
        List<Clinician_Facility__c> relationships = new List<Clinician_Facility__c>();
		

        
        for(Clinician__c clinician : clinicians) {
            for(Facility__c facility : facilities) {
                if(clinician.Specialization__c == facility.Specialization__c) {
                    Clinician_Facility__c clinicanFacilityRellationship = new Clinician_Facility__c(Clinician__c = clinician.Id, Facility__c = facility.Id);
                    //insert clinicanFacilityRellationship;
                    relationships.add(clinicanFacilityRellationship);                    
                }
            }
        }
        insert relationships; 
    }

}