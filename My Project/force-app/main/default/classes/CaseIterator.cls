public without sharing class CaseIterator implements Iterable<Case>, Iterator<Case> {
    // List to hold Case records retrieved from the query
    public List<Case> cases;
    // Index to track the current position in the list
    public Integer index;
    /**
     * Constructor for the CaseIterator class.
     * Executes a SOQL query to retrieve all open (non-closed) Case records.
     */
    public CaseIterator() {
        // Query for all open Case records
        cases = [SELECT Id FROM Case WHERE IsClosed = false];
        // Initialize the index to the start of the list
        index = 0;
    }

    /**
     * Returns the iterator instance for this CaseIterator.
     * This is required by the Iterable interface.
     * @return This instance of CaseIterator, which implements the Iterator interface.
     */
    public Iterator<Case> iterator() {
        return this;
    }

    /**
     * Checks if there are more Case records to iterate over.
     * @return True if there are more records to process; false otherwise.
     */
    public Boolean hasNext() {
        // Returns true if the index is within the bounds of the list
        return index < cases.size();
    }

    /**
     * Retrieves the next Case record in the iteration.
     * @return The next Case record; null if there are no more records.
     */
    public Case next() {
        // Loop until a next record is available
        while (hasNext()) {
            // Get the Case record at the current index
            Case c = cases.get(index);  
        
            // Move the index to the next record
            index++;
            // Return the current Case record
            return c;
        }
        // Return null if no more records are available
        return null;
    }
}