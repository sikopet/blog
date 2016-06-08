* event data - raw data after indexing; composed of events
* searchable events - events + information about Splunk's structure and processing
* bucket - raw data + indexes

Splunk stores data it indexed and its indexes within *flat files* in a structured directory (`$SPLUNK_HOME/var/lib/splunk`), meaning it doesn't require any database software running in the background. Splunk breaks data into events based on the timestamps it identifies.

Splunk data pipeline: input => parsing => indexing => searching
