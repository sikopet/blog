- distributed search engine built on top of Apache Lucene (a search engine
  library)
- use JSON over HTTP API (and get back a JSON reply) for indexing, searching
  and managing settings
- clustered by default, you can easily add/remove servers
- data is automatically divided into shards, which get balanced and replicated
  across the available servers in your cluster
- unlike relational database, which stores data in records or rows, ES stores
  data in documents
- relational DB (SQL): tables, columns, rows
- ES (noSQL): documents, keys, values
