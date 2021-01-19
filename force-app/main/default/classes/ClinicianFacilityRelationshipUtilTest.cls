@isTest
public class ClinicianFacilityRelationshipUtilTest {
	
    //	Testing effect of createClinicianFacilityRelationship method
    @isTest public static void createClinicianFacilityRelationshipEffectsTest() {
        
       
        
  		Clinician__c[] clinicians = [SELECT Specialization__c FROM Clinician__c];
        List<Clinician__c> pediatricians = [SELECT Name, Specialization__c FROM Clinician__c WHERE Specialization__c = 'surgery'];
        List<Clinician__c> surgeons = [SELECT Name, Specialization__c FROM Clinician__c WHERE Specialization__c = 'psychiatry'];
        List<Clinician__c> psychiatrists = [SELECT Name, Specialization__c FROM Clinician__c WHERE Specialization__c = 'paediatrics'];
        
        List<Facility__c> facilities = [SELECT Name, Specialization__c FROM Facility__c];
        List<Facility__c> pediatricFcilities = [SELECT Name, Specialization__c FROM Facility__c WHERE Specialization__c = 'paediatrics'];
        List<Facility__c> psychiatricFacilities = [SELECT Name, Specialization__c FROM Facility__c WHERE Specialization__c = 'psychiatry'];
        List<Facility__c> surgicalFacilities = [SELECT Name, Specialization__c FROM Facility__c WHERE Specialization__c = 'surgery'];
        
        Integer numberOfClinicians = clinicians.size();
        
		System.assertEquals(5, numberOfClinicians);
    }
}