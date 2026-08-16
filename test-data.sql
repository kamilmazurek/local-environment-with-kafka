CREATE STREAM IF NOT EXISTS items (id VARCHAR KEY, name VARCHAR, description VARCHAR) WITH (KAFKA_TOPIC='items', VALUE_FORMAT='JSON', PARTITIONS=1);
INSERT INTO items (id, name, description) VALUES ('1', 'Item A', 'Test item A');
INSERT INTO items (id, name, description) VALUES ('2', 'Item B', 'Test item B');
INSERT INTO items (id, name, description) VALUES ('3', 'Item C', 'Test item C');
EXIT;