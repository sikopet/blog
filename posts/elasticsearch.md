- distributed search engine built on top of Apache Lucene (a search engine
  library)
- use JSON over HTTP API (and get back a JSON reply) for indexing, searching
  and managing settings
- clustered by default, you can easily add/remove servers
- data is automatically divided into shards, which get balanced and replicated
  across the available servers in your cluster
- unlike relational database, which stores data in records or rows, ES stores
  data in documents
- relational DB (SQL): row, table, column, database
- ES (noSQL): document, type, field/value, index

Data organization (layout):
- [logical](https://raw.github.com/jreisinger/blog/master/files/es_logical.jpg):
  important for for apps
- [physical](https://raw.github.com/jreisinger/blog/master/files/es_physical.jpg):
  important for admins as it determines performance, scalability, and availability

More
- Elasticsearch in Action (2015)
