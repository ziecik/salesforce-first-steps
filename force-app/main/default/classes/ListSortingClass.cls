global class ListSortingClass {
	
    public static List<String> sortByLength(List<String> customList) {
        List<String> sortedList = new List<String>();
        List<Word> words = new List<Word>();
        
        for(Integer i = 0; i < customList.size(); i++) {
            words.add(new Word(customList.get(i)));
        }
        
        words.sort();
        
        for(Integer i =0; i < words.size(); i++) {
            sortedList.add(words.get(i).getWordValue());
        }
        
        return sortedList;
    }
    
    
    global class Word implements Comparable {
        private String wordValue;
        
        public Word(String wordValue) {
            this.wordValue = wordValue;
        }
        
        public String getWordValue() {
            return this.wordValue;
        }
        
        global Integer compareTo(Object compareTo) {
            if(wordValue.length() == ((Word)compareTo).getWordValue().length()) {
            	if(wordValue.toLowerCase().compareTo(((Word)compareTo).getWordValue().toLowerCase()) > 0)
                    return 1;
                else if(wordValue.toLowerCase().compareTo(((Word)compareTo).getWordValue().toLowerCase()) < 0)
                    return -1;
                else if(wordValue.toLowerCase().compareTo(((Word)compareTo).getWordValue().toLowerCase()) == 0)
                    return wordValue.compareTo(((Word)compareTo).getWordValue()); 
                else
                    return 0;
            } 
            else if (wordValue.length() > ((Word)compareTo).getWordValue().length())
                return 1;
            else
                return -1;
        }
    }
}