* raw data - data that has not been previously added to Splunk 
* event data - raw data after indexing; composed of events
* searchable events - events + information about Splunk's structure and processing

Splunk stores data it indexed and its indexes within *flat files* (in a structured directory), meaning it doesn't require any database software running in the background.
