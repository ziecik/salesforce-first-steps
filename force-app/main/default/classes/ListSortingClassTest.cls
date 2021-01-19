@isTest
public class ListSortingClassTest {
    
    @isTest public static void testListSorting() {
		List<String> inputList = new List<String>();
        inputList.add('ab');
        inputList.add('BR');
        inputList.add('jAg');
        inputList.add('x');
        inputList.add('Zoo');
        inputList.add('br');
        inputList.add('wc');
        inputList.add('i');
        inputList.add('cld');
        inputList.add('wrc');
        inputList.add('lx');
        inputList.add('JAG');
        
        List<String> expectedList = new List<String>();
        expectedList.add('i');
        expectedList.add('x');
        expectedList.add('ab');
        expectedList.add('BR');
        expectedList.add('br');
        expectedList.add('lx');
        expectedList.add('wc');
        expectedList.add('cld');
        expectedList.add('JAG');
        expectedList.add('jAg');
        expectedList.add('wrc');
        expectedList.add('Zoo');
        
        List<String> outputList = ListSortingClass.sortByLength(inputList);
        
        System.assertEquals(expectedList, outputList);
    }
}