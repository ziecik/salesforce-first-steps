@isTest
public class ClinicianFacilityRelationshipUtilTest {
	Integer numberOfClinicians;
    @testSetup static void setup() {
    	List<Clinician__c> clinicians = new List<Clinician__c>();
        clinicians.add(new Clinician__c(Specialization__c='surgery'));
        clinicians.add(new Clinician__c(Specialization__c='surgery'));
        clinicians.add(new Clinician__c(Specialization__c='paediatrics'));
        clinicians.add(new Clinician__c(Specialization__c='psychiatry'));
        insert clinicians;
        
        List<Facility__c> facilities = new List<Facility__c>();
        facilities.add(new Facility__c(Specialization__c='surgery'));
        facilities.add(new Facility__c(Specialization__c='surgery'));
        facilities.add(new Facility__c(Specialization__c='paediatrics'));
        facilities.add(new Facility__c(Specialization__c='paediatrics'));
        facilities.add(new Facility__c(Specialization__c='psychiatry'));
        insert facilities;
        
        List<Id> clinId = new List<Id>();
        for(Clinician__c clin : clinicians) {
            clinId.add(clin.Id);
        }
        ClinicianFacilityRelationshipUtil.createClinicianFacilityRelationship(clinId);
    }
   
    // setup test
    @isTest 
    public static void setupTest() { 
        System.assertEquals(4, [SELECT COUNT() FROM Clinician__c]);
        System.assertEquals(2, [SELECT COUNT() FROM Clinician__c WHERE Specialization__c = 'surgery']);
        System.assertEquals(1, [SELECT COUNT() FROM Clinician__c WHERE Specialization__c = 'paediatrics']);
        System.assertEquals(1, [SELECT COUNT() FROM Clinician__c WHERE Specialization__c = 'psychiatry']);
        
        System.assertEquals(5, [SELECT COUNT() FROM Facility__c]);
        System.assertEquals(2, [SELECT COUNT() FROM Facility__c WHERE Specialization__c = 'surgery']);
        System.assertEquals(2, [SELECT COUNT() FROM Facility__c WHERE Specialization__c = 'paediatrics']);
        System.assertEquals(1, [SELECT COUNT() FROM Facility__c WHERE Specialization__c = 'psychiatry']);
    }
    
    @isTest 
    public static void createClinicianFacilityRelationshipEffectsTest() {    
        System.assertEquals(7, [SELECT COUNT() FROM Clinician_Facility__c]);
        System.assertEquals(4, [SELECT COUNT() FROM Clinician_Facility__c WHERE Clinician__r.Specialization__c= 'surgery']);  
        System.assertEquals(2, [SELECT COUNT() FROM Clinician_Facility__c WHERE Clinician__r.Specialization__c= 'paediatrics']);
        System.assertEquals(1, [SELECT COUNT() FROM Clinician_Facility__c WHERE Clinician__r.Specialization__c= 'psychiatry']);
    }
}