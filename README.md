# Local Development Environment with Apache Kafka

This repository contains an implementation of a local development environment, featuring Apache Kafka, ksqlDB, AKHQ, and Schema Registry.  The environment is built with Docker Compose, running Kafka in modern KRaft mode.
It provides a ready-to-use local infrastructure designed to quickly start working with Kafka, e.g., data engineering, building microservices, developing stream processing applications, performing data analysis, or designing ETL pipelines.

Key advantages:
* **Developer Productivity**: Ready-to-use, cross-platform setup lets developers start quickly while ensuring consistent infrastructure across teams.
* **Simple Architecture**: Runs Kafka in KRaft mode, simplifying local setup, accelerating boot times, and reducing memory usage.
* **Unified Visibility**: Pre-configured AKHQ provides a UI to visually inspect topics, manage consumer groups, and view messages.
* **Stream Processing Ready**: Includes ksqlDB server and CLI, allowing you to query, filter, and manipulate streams using SQL-like syntax.
* **Schema Management**: Integrates with Schema Registry for managing Avro, Protobuf, or JSON schemas when strict data contracts are required.
* **Ease of Testing**: Scripts support environment provisioning, cleanup, and test data seeding, while AKHQ and ksqlDB provide visibility of topics and streams.

The goal is to keep it useful, simple, clean, and easy to run.

## Quickstart

TODO

## Table of Contents
* [Reusable Local Environment](#reusable-local-environment)
* [Apache Kafka in Data Engineering](#apache-kafka-in-data-engineering)
* [Technology Stack](#technology-stack)
* [Deployment](#deployment)
* [Seeding Test Data](#seeding-test-data)
* [Monitoring and Management via AKHQ](#monitoring-and-management-via-akhq)
* [Managing Topics and Messages via CLI](#managing-topics-and-messages-via-cli)
* [Schema Registry for Data Contracts](#schema-registry-for-data-contracts)
* [SQL-Based Stream Processing with ksqlDB](#sql-based-stream-processing-with-ksqldb)
* [Stop and Cleanup](#stop-and-cleanup)
* [Additional Resources](#additional-resources)
* [Author](#author)
* [Disclaimer](#disclaimer)

## Reusable Local Environment

While working with data projects, I've noticed that a reusable, modern and convenient local Kafka environment provides a nice boost to efficiency.
I also found out that starting a new data-intensive project often involves repeatedly configuring Kafka brokers (sometimes with ZooKeeper), setting up a Schema Registry, and looking for a way to test basic flows.
This environment reduces that overhead by providing a solid foundation for building stream processing applications and microservices.

To accelerate development while maintaining an industry-standard stack, the environment is preconfigured with:
* **Apache Kafka (KRaft mode)**: Runs without ZooKeeper, reducing local memory footprint and startup time.
* **Schema Registry**: Manages Avro, Protobuf, or JSON schemas to enforce strict data contracts.
* **ksqlDB**: Simplifies data analysis with intuitive SQL-like queries.
* **AKHQ**: Provides a clean web interface to easily inspect topics, messages, and consumer groups.
* **Wrapper Scripts**: Help with controlling environment and seeding test data.

It reduces repetitive setup by providing ready-to-use infrastructure, allowing developers to focus on producing, consuming, and transforming data.

## Apache Kafka in Data Engineering

Apache Kafka has become a major part of modern data engineering and works as the backbone of many event-driven systems.
Instead of relying on point-to-point integrations or traditional batch processing, it separates the systems generating data from those reading it, allowing organizations to process, route, and store massive streams of events in real-time.

In a typical data engineering workflow, Kafka works well with **Streaming ETL** (Extract, Transform, Load), real-time analytics, and event-driven architectures.

This local environment lets you actually develop and test these workflows by running the essential components of a streaming platform directly on your machine:
* **Storage & Delivery**: Kafka brokers reliably receive and persist high-throughput streams published by your databases or APIs, and efficiently serve that data to downstream consumers.
* **Data Quality & Governance**: Schema Registry enforces strict data contracts, ensuring producers and consumers always agree on data structures.
* **Real-Time Transformation**: ksqlDB lets you process, filter, join, and aggregate data using SQL-like syntax.
* **Observability**: AKHQ provides immediate visibility into topics, partitions, and message payloads, making local debugging easy.

Whether you are building a fraud detection system, synchronizing databases, or feeding a data lake, this environment provides the tools needed to prototype and test those data flows locally.

## Technology Stack

The environment is built around the Apache Kafka ecosystem and relies on Docker Compose to orchestrate the infrastructure.
It provides a fully functional event streaming platform without the need to install anything locally other than Docker.

In summary, the stack looks as follows:
- **Streaming Platform**
    - **Apache Kafka**: Core event streaming platform configured to run in modern KRaft mode (ZooKeeper-free).
    - **Schema Registry**: Centralized service for managing and validating message schemas (Avro, Protobuf, JSON).

- **Data Analytics**
    - **ksqlDB Server**: Engine for analyzing streaming data with SQL-like syntax.
    - **ksqlDB CLI**: Interactive command-line interface to write and execute queries.

- **Observability**
    - **AKHQ**: Web-based UI used to visually inspect Kafka topics, read message payloads, and manage consumer groups.

- **Infrastructure & Automation**
    - **Docker and Docker Compose**: Platforms used to containerize and spin up the entire cluster consistently.
    - **Bash and Batch Scripts**: Custom wrapper scripts (`dev-env.sh` and `dev-env.bat`) designed to simplify environment lifecycle management.

## Deployment

The entire infrastructure is containerized and orchestrated using Docker Compose.
To make managing the lifecycle of the environment easier, this repository includes wrapper scripts (`dev-env.sh` for Linux/macOS and `dev-env.bat` for Windows).

### Start the Environment
To start the Kafka broker, Schema Registry, ksqlDB, and AKHQ in the background, simply use the `start` command:

**For Linux/macOS:**
```bash
./dev-env.sh start
```

**For Windows:**
```cmd
dev-env start
```

You should see a confirmation that the environment started successfully, along with the local endpoints for your services:
* Kafka Broker: `localhost:9092`
* Schema Registry: `http://localhost:8081`
* AKHQ UI: `http://localhost:8080`
* ksqlDB Server: `http://localhost:8088`

### image goes here

### Verify Services and Logs

It may take a few moments for all the services to fully initialize.
You can check the status of your containers by running:

**For Linux/macOS:**
```bash
./dev-env.sh status
```

**For Windows:**
```cmd
dev-env status
```

If you need to troubleshoot or simply want to watch the components boot up in real-time, you can easily tail the logs for all services:

**For Linux/macOS:**
```bash
./dev-env.sh logs
```

**For Windows:**
```cmd
dev-env logs
```

## Seeding Test Data

By default, the started Kafka cluster contains no messages, so you may want to add some test data.
To make testing easier and more efficient, this environment includes a quick way to inject sample data using the provided wrapper scripts.

Test data is stored in the `test-data.sql` file, which contains ksqlDB statements.
By default, it automatically creates a stream named `items` and inserts three sample records into it.

When you run the `test-data` command, the script pipes the contents of `test-data.sql` directly into the `ksqldb-cli` container, executing the queries on the `ksqldb-server`.

To seed the environment with test data, **wait until the environment is fully initialized**, then run the following command:

**For Linux/macOS:**
```bash
./dev-env.sh test-data
```

**For Windows:**
```cmd
dev-env test-data
```

Once the script completes successfully, you can easily verify that the messages were published to your cluster, e.g. by using AKHQ.
To do so, simply open your browser and navigate to `http://localhost:8080` to visually inspect the newly created items topic and view the message payloads.

## Monitoring and Management via AKHQ

AKHQ provides a web-based user interface that helps developers view and manage Kafka clusters without needing to rely strictly on command-line utilities.
It offers a convenient way to observe cluster activity, produce test messages, check active listeners, and review stored records.
Pre-configured in the Docker Compose setup, it connects directly to your Kafka broker and Schema Registry.

To open the interface, navigate to `http://localhost:8080` in your web browser.

Once open, the dashboard gives you a unified view of your local environment:
* **Topic Management:** View a complete list of topics, check partition layouts, inspect replication details, create new topics, or modify existing configurations.
* **Data Browsing:** Inspect real-time message payloads, keys, timestamps, and headers inside any topic. If you are using Schema Registry, AKHQ automatically handles message deserialization.
* **Consumer Groups:** Monitor active consumer groups, track consumer lag across partitions, and review offset assignments.
* **Schema Registry:** Explore registered schemas, check version history, and validate compatibility rules directly through the UI.

As an example, here is a quick glimpse of how the AKHQ interface displays messages:

### TODO: ADD IMAGE

Having immediate visual feedback on your topics and messages makes debugging streaming applications significantly easier.

## Disclaimer

THIS SOFTWARE AND ANY DOCUMENTATION INCLUDED IN THIS REPOSITORY AND CREATED BY THE AUTHOR
(INCLUDING, BUT NOT LIMITED TO, THE README.MD FILE) ARE PROVIDED FOR EDUCATIONAL PURPOSES ONLY.

THE SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE,
THE DOCUMENTATION, OR THE USE OR OTHER DEALINGS IN THE SOFTWARE OR DOCUMENTATION.

THIRD-PARTY LIBRARIES REFERENCED OR INCLUDED IN THIS SOFTWARE ARE SUBJECT TO THEIR OWN LICENSES.
THIRD-PARTY DOCUMENTATION OR EXTERNAL RESOURCES REFERENCED IN THIS REPOSITORY ARE SUBJECT TO THEIR OWN LICENSES AND TERMS.

Apache Kafka is a trademark of the Apache Software Foundation. Docker is a trademark or registered trademark of Docker, Inc.
ksqlDB is trademark of Confluent, Inc. AKHQ, Schema Registry and other names may be trademarks of their respective owners.