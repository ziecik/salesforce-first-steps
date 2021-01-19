public class SearchingController {

    List<AggregateResult> grupedResult; 

    
    public List<AggregateResult> result {
        get {
            return grupedResult;
        }
        set;
    }

    
    public String searchAcc {get;set;}
    public Integer searchNumber {get;set;}
    
    public SearchingController() {
    }
    
    
    public void search() {       
        grupedResult = [SELECT Account.Name name, COUNT(Id) numberOfContacts FROM Contact WHERE Account.Name LIKE:('%'+searchAcc+'%') GROUP BY Account.Name HAVING COUNT(Account.Name) = :searchNumber];

    }
}